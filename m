Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 337269CA2D
	for <lists+dm-devel@lfdr.de>; Mon, 26 Aug 2019 09:24:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C98E3082138;
	Mon, 26 Aug 2019 07:24:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05A455D9C3;
	Mon, 26 Aug 2019 07:24:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08DA12551B;
	Mon, 26 Aug 2019 07:24:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7NHpSjK010429 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 13:51:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E2B1261A7; Fri, 23 Aug 2019 17:51:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2808F2634B
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 17:51:25 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
	[67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D0E710576F0
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 17:51:24 +0000 (UTC)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x7NHdb0e024630; Fri, 23 Aug 2019 10:51:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-id
	: content-transfer-encoding : mime-version; s=facebook;
	bh=GLeAxw5ffs4hptBIrfleWpu4AMGGihIQPL54jJN87fY=;
	b=jjev0VU2YaqF9NifPoy5SdFkKMN6plrjIhnBXLRmSFsTwqVETYCDVysicxqDGfz4Lv5M
	UvQyGTZG9SFF78yRV3n7dYUtPYL/eTnk3ds6lgW7QOq7S8daGTv+Oo9LGYpOO05aSrV3
	N21SeV82HeRNrmZjTiVdLi+YsrbBNI2wS18= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
	by mx0a-00082601.pphosted.com with ESMTP id 2ujkcb8g8x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2019 10:51:22 -0700
Received: from prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) by
	prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Fri, 23 Aug 2019 10:51:20 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
	prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Fri, 23 Aug 2019 10:51:20 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
	by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
	(version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
	via Frontend Transport; Fri, 23 Aug 2019 10:51:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CHY3DdBi9UgQ5hJyNjmOtAoV+2Y7r9t9okFT1sshauf0PvbLMFGdhU+HbRapookrl5ewqg70k2qbciODw9D2HAymq47VpwhK37P05fjvPSOFbCUStF7DlLopLhv6QAsvP0MA1Q5PXmfmGplVjogtf8eOV7OsEC7U+NvfJLqdtbMAKvcLKkujm/KFReHcoQC3uPtJfHhXlmQe9WfgxOvGNPVQGQU7zDFRibfnDJcFN3p9jR6kFOuF/3sMaZg9arMQO97pBzsA5nlH9L81rWVmMF1KA5w/m9kpK1hD1avtVQKbZiKO9V8Ywnz2ZvF91lbiY6ni6MzcJlQUlAKxwWYVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GLeAxw5ffs4hptBIrfleWpu4AMGGihIQPL54jJN87fY=;
	b=oCisUXsLn1U4zjx9netaxMT+tgCkO1D6DvksIiLB7NU+hQ9Ov2rVJh9Cpe59DB18StPI3mVIshYUsp/6sNikUnYqcLUFQYz+Dpn+/SFKvdHCuTK47gmUr+tmiKCvQ0VS7rdBn+VdtfVyP/aDrQo6BIKs+a6AEGVcY65DGwC2pcx5P4VFjjs2r1MjG76TqIbmUi6jLuRGW06nQhK1I4JEGfhpD0HEs9kNt+xrxc3BZIxDRcVbkn0+SjXe1CSLGlSHvhiovwANIo43FhtFBURfxps0iRqDOm+uWWLWpsmwGgQlzbTLyvLUd3rCvNWEkv7ZHrndUfuR+XiEVfQxML0kGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com;
	dkim=pass header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
	s=selector2-fb-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GLeAxw5ffs4hptBIrfleWpu4AMGGihIQPL54jJN87fY=;
	b=ImwAQaGoTD1t3gF+UXN6uj+iKXqz7r1pxnhxS5BXzIQOXgGnnb8UDnFtzCl0a1vC+qZXTwO5JtaOjsAt7Xi0GheBMhSv8KunwISN3nW1Wb66b6hrclHLgwtAqlQ35pfUj1Cx5jPHB0So28EQQ35W3UC1tPICYd60/O5xCWUwJw8=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
	MWHPR15MB1518.namprd15.prod.outlook.com (10.173.235.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.16; Fri, 23 Aug 2019 17:51:19 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::45ee:bc50:acfa:60a5]) by
	MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::45ee:bc50:acfa:60a5%3]) with mapi id 15.20.2178.020;
	Fri, 23 Aug 2019 17:51:19 +0000
From: Song Liu <songliubraving@fb.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Thread-Topic: [PATCH v3 1/2] md raid0/linear: Mark array as 'broken' and fail
	BIOs if a member is gone
Thread-Index: AQHVWQTWiOO9/lvNXkO6JBhdqUPdfKcHto6AgAFNYYCAAADCAA==
Date: Fri, 23 Aug 2019 17:51:18 +0000
Message-ID: <F0E716F8-76EC-4315-933D-A547B52F1D27@fb.com>
References: <20190822161318.26236-1-gpiccoli@canonical.com>
	<73C4747E-7A9E-4833-8393-B6A06C935DBE@fb.com>
	<8163258e-839c-e0b8-fc4b-74c94c9dae1d@canonical.com>
In-Reply-To: <8163258e-839c-e0b8-fc4b-74c94c9dae1d@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::333a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 788059d4-a34d-4766-7e52-08d727f280b9
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:MWHPR15MB1518; 
x-ms-traffictypediagnostic: MWHPR15MB1518:
x-microsoft-antispam-prvs: <MWHPR15MB15184A995A36743CACD768E0B3A40@MWHPR15MB1518.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(39860400002)(376002)(136003)(346002)(189003)(199004)(64756008)(6916009)(86362001)(14454004)(33656002)(46003)(81156014)(54906003)(8676002)(8936002)(2906002)(14444005)(71200400001)(446003)(71190400001)(256004)(11346002)(486006)(6116002)(57306001)(2616005)(5660300002)(476003)(478600001)(66446008)(66476007)(229853002)(76116006)(6486002)(305945005)(66946007)(50226002)(66556008)(6506007)(102836004)(36756003)(53546011)(316002)(25786009)(76176011)(6436002)(6246003)(6512007)(99286004)(186003)(81166006)(53936002)(7736002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1518;
	H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yfJKA9mKRKKaZ6pFCF74UGAX7oQZkW3Lo2AnINf2itgSmoXbYarv/tnW9tr6H5tbpdIYPwy/HDkiuJPeatA3LB5BBZ34q1A0qbQNY/me/xKpJwjcu7Iq+0UdRyJIXGOm60fWhBTZfqkRwTdf1WlPGQ4dooyXMl73cDxqap3y3N6YLGuVpB5XNOht+SRWcKR0HKqluo9QVIwBYSXZpGCiXGTNkJgESj/43Q60zQvlJeA6pSQ3tNlIaSw3pejQrQG8i2oxVZy8mB7cdNlUozCjCn9n3MVBv6a5vhY1KikA1Z+6OoUqtemwlN8Uy2EYN28HuGKvMrRMpEuQCLYpo4IUhpKVIu9YMgvguvODhwqZ29lj5/zDrhli84++poBR82nLI32gfb4PoFbPhCKy4B7LR7AtGmjYOh8XNyzkevIis04=
x-ms-exchange-transport-forked: True
Content-ID: <0674B3614E0FBC4BABE51F8D02901F68@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 788059d4-a34d-4766-7e52-08d727f280b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 17:51:18.9964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1DfPS69ac2v2CrrH/SlGYxuiRUgflP8PFlqOXqH4rVxWZSM/h+ArzPq5ZQjun+hTzNsgB++4CnHdVkXnx23GoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1518
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-08-23_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=981 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1906280000 definitions=main-1908230169
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.64]); Fri, 23 Aug 2019 17:51:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Fri, 23 Aug 2019 17:51:24 +0000 (UTC) for IP:'67.231.145.42'
	DOMAIN:'mx0a-00082601.pphosted.com'
	HELO:'mx0a-00082601.pphosted.com' FROM:'songliubraving@fb.com'
	RCPT:''
X-RedHat-Spam-Score: -0.8  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.145.42 mx0a-00082601.pphosted.com 67.231.145.42
	mx0a-00082601.pphosted.com
	<prvs=3138c4b8ea=songliubraving@fb.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7NHpSjK010429
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 26 Aug 2019 03:24:39 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <liu.song.a23@gmail.com>, NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v3 1/2] md raid0/linear: Mark array as
 'broken' and fail BIOs if a member is gone
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 26 Aug 2019 07:24:49 +0000 (UTC)



> On Aug 23, 2019, at 10:48 AM, Guilherme G. Piccoli <gpiccoli@canonical.com> wrote:
> 
> On 22/08/2019 18:55, Song Liu wrote:
>> [...] 
>>> +	if (unlikely(!(tmp_dev->rdev->bdev->bd_disk->flags & GENHD_FL_UP))) {
>>> +		if (!test_bit(MD_BROKEN, &mddev->flags))
>>> +			pr_warn("md: %s: linear array has a missing/failed member\n",
>>> +				mdname(mddev));
>>> +		set_bit(MD_BROKEN, &mddev->flags);
>>> +		bio_io_error(bio);
>>> +		return true;
>>> +	}
>>> +
>> 
>> Maybe we can somehow put this block in a helper and use it in both raid0
>> and linear code?
>> 
>> Otherwise, looks good to me. 
>> 
>> Thanks,
>> Song
>> 
> 
> OK, so something as a function with a prototype like
> "void md_is_broken(struct md_rdev *rd, const char *md_type)"
> is good for you?
> Then we can use that as the check if a member failed and in positive
> case, we can print the message (if not printed before) and return to the
> raid0/linear driver in order it fails the bio and returns.
> I'd prefer keeping the bio out of the helper, agreed?
> 

I guess md_is_broken() should return bool? Otherwise, looks good to me. 

Thanks,
Song


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
