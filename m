Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EA73AA7E72
	for <lists+dm-devel@lfdr.de>; Wed,  4 Sep 2019 10:53:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23F5C2DA980;
	Wed,  4 Sep 2019 08:53:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CED4B196AE;
	Wed,  4 Sep 2019 08:53:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6991C180BA9C;
	Wed,  4 Sep 2019 08:53:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83LuZKJ028577 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 17:56:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4542F60BFB; Tue,  3 Sep 2019 21:56:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DD2A60BE2
	for <dm-devel@redhat.com>; Tue,  3 Sep 2019 21:56:32 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
	[67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E22EA81F11
	for <dm-devel@redhat.com>; Tue,  3 Sep 2019 21:56:30 +0000 (UTC)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x83LtYvN013876; Tue, 3 Sep 2019 14:56:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-id
	: content-transfer-encoding : mime-version; s=facebook;
	bh=ryFHb4Q/c8EEyIZNE5ad6Kn69I8Ia0hGduIMd7KO+bY=;
	b=Di8Hi0P0T2ZYoTphkELXRUIy8u+iDztIzf2r3WjRSSBTMQzVZjejxQzzNxfdiVRZKqlC
	oV9y3G0rVTPzbOUrHOHpirigSXjGn29qX2r/B4w+miodQfyKtEfLfTemDJPm2IVbIkpI
	N8mPdyHngSsHo2LrHLIVQ8hfUs6ho1Hbzhs= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
	by mx0a-00082601.pphosted.com with ESMTP id 2usqs7am34-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2019 14:56:28 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
	prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Tue, 3 Sep 2019 14:56:27 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
	by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
	(version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
	via Frontend Transport; Tue, 3 Sep 2019 14:56:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=RyY2hsWwokI8KXPmK2rb9sMm4Y9OuJxXvLw9SJHc1RBeBQ51KexNPWH1qtzIkvK9f3diUBrRhsx6UirDCkl7pCzQ4Huz++nJMpMd42rHEpwS60KWrKgATEHFvzXcI9Xi/AcSXk0BgbLoVqFiR0uQBWB9BeNbOOiVB5jey80vm2M0bELYeQz+OfpJbay/RL31NQ1K+B+6aA+OaiJ/I3pKz4+sjAZ4l5qjOz87hhCK5z9AQcVXemhXeiUTKtCrtQ9oIh+iCRwDn1vtV6Klt4gklJK4KQEzVu7ITokge0AWwuewsfHje9uAvnAesgX3zbsHdLnZmEYNvpsxodma215kWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ryFHb4Q/c8EEyIZNE5ad6Kn69I8Ia0hGduIMd7KO+bY=;
	b=geCnnmI/2yWMllbjaFM7VvfoiakiFaPD1VIupKjn/8ljTeZlZKw3JYhjN1bc7Lxx7QOVQUzIoOX4r8XBE/B3fWyFYi3Dthhk/uXK9FgQFzX90WB11o6QzbBceVtDYiWWHpldRzXwdf4LpvXVPaK4BzBO15aJjrYXx9aYesr6SDXchdWw+I8HTYBkgErD5RNYv/g+nMoxjdOT6p6yIpsughxAx7vXQh9Cm0Vt297+MsKJFACwUVASoHR2jqNBppC5YMVf+fI+35AtbuV7QrkKFUnbcVei5UyApUqAbAHHov4+MfGmIgaZ7xgT4QJEOMrPnSX9ZVNWCCBFQbP1i1bm6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com;
	dkim=pass header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
	s=selector2-fb-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ryFHb4Q/c8EEyIZNE5ad6Kn69I8Ia0hGduIMd7KO+bY=;
	b=bl9ZEPoDqQb8i4CY3OxmhhUvn1cMbf+teFUr/HNXG1uAcaJ6d1+usw24pPhtoEm6O30eIr78/1DssMHl6vjAza8eDxvYsVnd0OJHJ12A6XYoYxz8sr4KiTHXlFdRvj6Lrk2J1wbiiMsg8EsxxXp1cmCfTtKNg3MKV/PhXPYcpgk=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
	MWHPR15MB1295.namprd15.prod.outlook.com (10.175.2.136) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2220.21; Tue, 3 Sep 2019 21:56:26 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::a828:5750:379d:b9a1]) by
	MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::a828:5750:379d:b9a1%8]) with mapi id 15.20.2220.022;
	Tue, 3 Sep 2019 21:56:26 +0000
From: Song Liu <songliubraving@fb.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Thread-Topic: [PATCH v4 1/2] md raid0/linear: Mark array as 'broken' and fail
	BIOs if a member is gone
Thread-Index: AQHVYpC0zfxAhEUkzE+4bGia4xat3acaf7qA
Date: Tue, 3 Sep 2019 21:56:26 +0000
Message-ID: <E393EAA5-6A9D-464A-A70E-56A258559712@fb.com>
References: <20190903194901.13524-1-gpiccoli@canonical.com>
In-Reply-To: <20190903194901.13524-1-gpiccoli@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:c3ed]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6f0f101-b8ce-4383-9cf3-08d730b9919d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:MWHPR15MB1295; 
x-ms-traffictypediagnostic: MWHPR15MB1295:
x-microsoft-antispam-prvs: <MWHPR15MB1295846D1D2C5084E1808006B3B90@MWHPR15MB1295.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(39860400002)(366004)(396003)(376002)(199004)(189003)(46003)(186003)(4326008)(99286004)(50226002)(14454004)(478600001)(8936002)(256004)(316002)(14444005)(305945005)(71190400001)(71200400001)(6512007)(7736002)(36756003)(86362001)(102836004)(6246003)(2906002)(54906003)(33656002)(76176011)(5660300002)(486006)(6506007)(76116006)(8676002)(81156014)(6436002)(11346002)(476003)(2616005)(53936002)(81166006)(229853002)(25786009)(446003)(6486002)(6916009)(66946007)(66446008)(64756008)(66556008)(66476007)(6116002)(57306001)(53546011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1295;
	H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KSs2vdN1Brpd22icsPkDIHhvqa7K7e7N5d9GLtjP97TF/E2Tg8Wv24Wu7X0+otjtdjKDS12V4qBpC429iFrEzDiG37QgBvifTgFQfQ+MSgk219CqAS1bauqtamgdR/vB8HOk9DJFMYR8pl4y98+jJeCbrj2BcZTRTr/yt+FwJWhCTSYeUzybS9ti2+lYuI+Pt02F46e/7A04gZ8TvuJ56hDvJeGANXcAQbAoxhGUXqKkejEK7XFhYsygFT5TNhT1OcImUiBIfB3STXKm6yU52viveJL5puxr1naCUnKO0uFz6F+ieEgG/ew/jbOv1l746qqhN3GN6h/3K2LOmm2fDhkVKqkvGeLmAMA7a72bPd0mWdL76P2xbknrnu+yBX/sHfEeAtxUpK8Jz75JrVJcHGNDgtix+kz7Go9uCQBUcSA=
x-ms-exchange-transport-forked: True
Content-ID: <FB31AF236DA4D745910BA0DA75430503@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f0f101-b8ce-4383-9cf3-08d730b9919d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 21:56:26.4444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zpRhbbHrKIFhkLabFsm5A0CIP099HUr/r/IkbSXDVM18mkBGzuZ8KSjJeph+bZzp/cdf1pI8Rc55sKAsKuNUlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1295
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
	definitions=2019-09-03_05:2019-09-03,2019-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	mlxscore=0
	mlxlogscore=999 impostorscore=0 suspectscore=0 bulkscore=0
	clxscore=1011
	lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
	spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=8.12.0-1906280000 definitions=main-1909030217
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Tue, 03 Sep 2019 21:56:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 03 Sep 2019 21:56:31 +0000 (UTC) for IP:'67.231.145.42'
	DOMAIN:'mx0a-00082601.pphosted.com'
	HELO:'mx0a-00082601.pphosted.com' FROM:'songliubraving@fb.com'
	RCPT:''
X-RedHat-Spam-Score: -0.8  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.145.42 mx0a-00082601.pphosted.com 67.231.145.42
	mx0a-00082601.pphosted.com
	<prvs=4149af157e=songliubraving@fb.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x83LuZKJ028577
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 04 Sep 2019 04:53:21 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"jes.sorensen@gmail.com" <jes.sorensen@gmail.com>,
	"nfbrown@suse.com" <nfbrown@suse.com>,
	"liu.song.a23@gmail.com" <liu.song.a23@gmail.com>,
	linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"jay.vosburgh@canonical.com" <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v4 1/2] md raid0/linear: Mark array as
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 04 Sep 2019 08:53:39 +0000 (UTC)



> On Sep 3, 2019, at 12:49 PM, Guilherme G. Piccoli <gpiccoli@canonical.com> wrote:
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
> 
> In other words, no -EIO is returned and writes (except direct ones) appear
> normal. Meaning the user might think the wrote data is correctly stored in
> the array, but instead garbage was written given that raid0 does stripping
> (and so, it requires all its members to be working in order to not corrupt
> data). For md/linear, writes to the available members will work fine, but
> if the writes go to the missing member(s), it'll cause a file corruption
> situation, whereas the portion of the writes to the missing devices aren't
> written effectively.
> 
> This patch changes this behavior: we check if the block device's gendisk
> is UP when submitting the BIO to the array member, and if it isn't, we flag
> the md device as MD_BROKEN and fail subsequent I/Os to that device; a read
> request to the array requiring data from a valid member is still completed.
> While flagging the device as MD_BROKEN, we also show a rate-limited warning
> in the kernel log.
> 
> A new array state 'broken' was added too: it mimics the state 'clean' in
> every aspect, being useful only to distinguish if the array has some member
> missing. We rely on the MD_BROKEN flag to put the array in the 'broken'
> state. This state cannot be written in 'array_state' as it just shows
> one or more members of the array are missing but acts like 'clean', it
> wouldn't make sense to write it.
> 
> With this patch, the filesystem reacts much faster to the event of missing
> array member: after some I/O errors, ext4 for instance aborts the journal
> and prevents corruption. Without this change, we're able to keep writing
> in the disk and after a machine reboot, e2fsck shows some severe fs errors
> that demand fixing. This patch was tested in ext4 and xfs filesystems, and
> requires a 'mdadm' counterpart to handle the 'broken' state.
> 
> Cc: Song Liu <songliubraving@fb.com>
> Reviewed-by: NeilBrown <neilb@suse.de>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>

Applied to md-next. 

Thanks!

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
