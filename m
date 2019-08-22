Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E8B9AF94
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 14:35:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50940A2FC49;
	Fri, 23 Aug 2019 12:35:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1615962A7A;
	Fri, 23 Aug 2019 12:35:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E0A9180B536;
	Fri, 23 Aug 2019 12:35:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7MLtXiQ007324 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Aug 2019 17:55:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0EB95C231; Thu, 22 Aug 2019 21:55:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E51585C221
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 21:55:30 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
	[67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FD511918641
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 21:55:29 +0000 (UTC)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x7MLrHf3009444; Thu, 22 Aug 2019 14:55:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-id
	: content-transfer-encoding : mime-version; s=facebook;
	bh=H4/KQt0L8iQTmgrdqPLaxrCl2zptw4B5kisKbZcEu28=;
	b=BXv3y/LSUnKxaFprH5uKa9f553ev7W6qsn+SQ60B9aG05ICFuyavb6tBP8VsQLyhkP71
	Xu0r6bCWLtLeUfGTXVGA8xrFCuFtB6BlIDQZ0yxZrEmp3Ta1oVhZv6Vu+9JGxeBFGH9i
	6Vxh+Hta2m+H7o1u17CYxlyKcFbsD3kZs+Y= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
	by mx0a-00082601.pphosted.com with ESMTP id 2uhxr2sd5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2019 14:55:25 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
	prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Thu, 22 Aug 2019 14:55:24 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
	by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
	(version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
	via Frontend Transport; Thu, 22 Aug 2019 14:55:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=kYGOkSIxmajqyYUY/uQLHj7gacrfhQtKOx11GI3POEvUiBgZlPnlO+ptj4V11Rghh84fvPlvQGL1mjCWHDaqZ3B0Z/fHJV9vmo3AUBGk1OVoSNYth47lVma3HxqFxKM96apu0+VqA7louDZmXsI4MC5RtayRGJ6dKc1PUtax3jNz0wM1P+YPES43TQf85QK9CQIhuT+yaClK9n9BLtQtOVMXbwmx98JRr4eTd0/JkC8NScN2vPS5IvIGsI/1VTzT7VBmYeGfqHn+WlY+bcdPlLgxfRk9cA20Mz8HuniqJiPOYxzzcRmdTqu4w0+IdO0j3mXS0+9L6uFOPcIoH5CVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=H4/KQt0L8iQTmgrdqPLaxrCl2zptw4B5kisKbZcEu28=;
	b=bl31RhUR14ROLnyMPSrAyKAqwkL6ViIoq7z7QIjsBUbN7JlHSi1Qaoy0GD34g8yVQXPq0vrUzSsS/veTWKphepbD++NY7nlQpxBN3bKqvcfg0zlITvO+OS9Ao6PNoV7evk+Qied1oJ3mghQHzM2WvBoJcNXYV+/9y8yBg6WJpSTHZA53OuEG9rpEu21FDNsSOk6D0z3B4TlV0rP2Nlcsz8hz+1HgYPv9ETqkg4OImV1QNrvEGT+sIkOemJwd4xE7HZmZMmAlPFwuFAVG5nFcxBT9TPuKRQnxC+MoFr71leh0gUrb2m8tCjbIAmzigvwcX6fden3BHcAfTCfRx9VMfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com;
	dkim=pass header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
	s=selector2-fb-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=H4/KQt0L8iQTmgrdqPLaxrCl2zptw4B5kisKbZcEu28=;
	b=VNY218RJs39T5baSOYuCRQGmLVMegUoByEY3VaQFtG/KigKKghldc/FNOByEdmqdgTIUqtN8FzPptWRVOTTfrtXasul7XbcP94shcR0dGVo67E6Jj7sfDpOvG2u/O3s9waXCuhL/MZU4avSDQzTT+0KY8ABgpgpuoJQTMYV/A4M=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
	MWHPR15MB1167.namprd15.prod.outlook.com (10.175.3.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.16; Thu, 22 Aug 2019 21:55:24 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::45ee:bc50:acfa:60a5]) by
	MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::45ee:bc50:acfa:60a5%3]) with mapi id 15.20.2178.020;
	Thu, 22 Aug 2019 21:55:24 +0000
From: Song Liu <songliubraving@fb.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Thread-Topic: [PATCH v3 1/2] md raid0/linear: Mark array as 'broken' and fail
	BIOs if a member is gone
Thread-Index: AQHVWQTWiOO9/lvNXkO6JBhdqUPdfKcHto6A
Date: Thu, 22 Aug 2019 21:55:23 +0000
Message-ID: <73C4747E-7A9E-4833-8393-B6A06C935DBE@fb.com>
References: <20190822161318.26236-1-gpiccoli@canonical.com>
In-Reply-To: <20190822161318.26236-1-gpiccoli@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:180::8436]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62d764b0-d50b-4d81-25d5-08d7274b6f6c
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:MWHPR15MB1167; 
x-ms-traffictypediagnostic: MWHPR15MB1167:
x-microsoft-antispam-prvs: <MWHPR15MB11678CAE994C7CA0A9C8C732B3A50@MWHPR15MB1167.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(376002)(366004)(39860400002)(346002)(199004)(189003)(102836004)(305945005)(5660300002)(478600001)(53936002)(57306001)(6916009)(33656002)(6436002)(2906002)(6246003)(6486002)(50226002)(36756003)(6512007)(14454004)(7736002)(64756008)(66476007)(256004)(14444005)(486006)(46003)(446003)(2616005)(11346002)(76176011)(476003)(71190400001)(76116006)(86362001)(66946007)(71200400001)(99286004)(6116002)(4326008)(54906003)(25786009)(316002)(8936002)(81156014)(81166006)(8676002)(53546011)(229853002)(6506007)(186003)(66446008)(66556008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1167;
	H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WV4TmJ5iLViMkLNm6M9II8rIFIonhD+pHYiysltBNOC3X5WwOEc79puplVOET2KRoV1qvXldet4CUeVhNmzxngRMZU5JRLtf+h8mm0qHq5d+iNZLW86Jx80peAFIIKRw8ne3QJ/fjN7Ld1KGketkSJ3i4rKpScxNS6rbwQsDBUSREj6yT4LG7ZyJbnlCxXtjhwd4g9IdDBiu7qGvrMjVzuXv2DauCJoqkGOzIQb0EHVJCNW8cLx2/cIEp1G9CSr210HSCfepZMANT0z9oL8X8XjFdpOlypFOy30+S0UIe7cDHJifZZ8bj1q1ElGe79lZEalee8CCXoiv7ZuXrbri63pbtD8PXILmHZORcF0JMq/M8njOcnV+JWA+yqDzzZx+25X22DDCM1Co4vlfiCSH0ZNP6aRIKgSI4NRkgkgFIsI=
x-ms-exchange-transport-forked: True
Content-ID: <9EB021AC02A93A41880C260032233E66@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d764b0-d50b-4d81-25d5-08d7274b6f6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 21:55:23.9999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TR7rR26xmkDlmAQX9x1pUIbGUNcoFXIUpuL5Vx4lU2t72cJBlQXp6DvAGPbAYYvDQSu2JJsJbU9Y+nwzFqssAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1167
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-08-22_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1906280000 definitions=main-1908220192
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.70]); Thu, 22 Aug 2019 21:55:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Thu, 22 Aug 2019 21:55:29 +0000 (UTC) for IP:'67.231.145.42'
	DOMAIN:'mx0a-00082601.pphosted.com'
	HELO:'mx0a-00082601.pphosted.com' FROM:'songliubraving@fb.com'
	RCPT:''
X-RedHat-Spam-Score: -0.8  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.145.42 mx0a-00082601.pphosted.com 67.231.145.42
	mx0a-00082601.pphosted.com
	<prvs=3137a4cb5b=songliubraving@fb.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7MLtXiQ007324
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 23 Aug 2019 08:34:47 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Fri, 23 Aug 2019 12:35:09 +0000 (UTC)



> On Aug 22, 2019, at 9:13 AM, Guilherme G. Piccoli <gpiccoli@canonical.com> wrote:
> 
> Currently md raid0/linear are not provided with any mechanism to validate
> if an array member got removed or failed. The driver keeps sending BIOs
> regardless of the state of array members, and kernel shows state 'clean'
> in the 'array_state' sysfs attribute. This leads to the following
> situation: if a raid0/linear array member is removed and the array is
> mounted, some user writing to this array won't realize that errors are
> happening unless they check dmesg or perform one fsync per written file.
> Despite udev signaling the member device is gone, 'mdadm' cannot issue the
> STOP_ARRAY ioctl successfully, given the array is mounted.

[...]

> drivers/md/md-linear.c |  9 +++++++++
> drivers/md/md.c        | 22 ++++++++++++++++++----
> drivers/md/md.h        |  3 +++
> drivers/md/raid0.c     | 10 ++++++++++
> 4 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/md/md-linear.c b/drivers/md/md-linear.c
> index 7354466ddc90..0479ccdbdeeb 100644
> --- a/drivers/md/md-linear.c
> +++ b/drivers/md/md-linear.c
> @@ -258,6 +258,15 @@ static bool linear_make_request(struct mddev *mddev, struct bio *bio)
> 		     bio_sector < start_sector))
> 		goto out_of_bounds;
> 
> +	if (unlikely(!(tmp_dev->rdev->bdev->bd_disk->flags & GENHD_FL_UP))) {
> +		if (!test_bit(MD_BROKEN, &mddev->flags))
> +			pr_warn("md: %s: linear array has a missing/failed member\n",
> +				mdname(mddev));
> +		set_bit(MD_BROKEN, &mddev->flags);
> +		bio_io_error(bio);
> +		return true;
> +	}
> +

Maybe we can somehow put this block in a helper and use it in both raid0
and linear code?

Otherwise, looks good to me. 

Thanks,
Song


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
