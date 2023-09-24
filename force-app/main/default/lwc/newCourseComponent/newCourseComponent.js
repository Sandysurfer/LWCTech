import { LightningElement, track } from 'lwc';
import insertAllCoursesRecords from '@salesforce/apex/LWCSaveCourseRows.saveCourseData';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class NewCourseComponent extends LightningElement {

    @track allCourses = [];
    courseName = "";
    courseDetails = "";
    isCourseAlreadyExists = false;
    courseNamehandleChange(event) {
        this.courseName = event.target.value;
    }

    courseDetailsHandleChange(event) {
        this.courseDetails = event.target.value;

    }

    addCourseHandleClick(event) {

        let existingCourseName = this.allCourses.filter(course => course.courseName == this.courseName)
        if (existingCourseName.length) 
        {
            this.isCourseAlreadyExists = true;
        }
        else
        {
            let newCourse = 
            {
         courseName: this.courseName,
                courseDetails: new DOMParser().parseFromString(this.courseDetails, "text/xml").firstChild.textContent,
                courseDetailsHtml: this.courseDetails
            }

            this.allCourses.push(newCourse);
            this.isCourseAlreadyExists = false;
        }
    
    }
    handleEditCourseClick(event){

        let editCourseName = event.target.dataset.id;
        let courseObj = this.allCourses.filter(course => course.courseName == editCourseName)[0];
        this.courseName = courseObj.courseName;
        this.courseDetails = courseObj.courseDetails;

    }

    handleSaveRecords(event) {
        let sfCourseList = [];
        for (let index = 0; index < this.allCourses.length; index++) {
            const element = this.allCourses[index];
            let courseObj = new Object();
            courseObj.Name = element.courseName;
            courseObj.courseDetails__c = element.courseDetailsHtml;
            sfCourseList.push(courseObj);
        }

        if (sfCourseList.length > 0) {
            insertAllCoursesRecords({ courseDataString: JSON.stringify(sfCourseList)}).then((response) => {
                console.log(response);
                this.showToast();
            }).catch((error) => {
                console.log('contact to system Adminstrator' +error);
            })
        }
    }
    showToast() {
        const event = new ShowToastEvent({
            title: 'Courses',
            message: 'All Courses has been Saved Successfully',
        });
        this.dispatchEvent(event);
    }
}