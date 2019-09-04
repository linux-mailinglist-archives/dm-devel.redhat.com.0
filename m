Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640EA9BCB
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 09:30:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE8B22A09D9;
	Thu,  5 Sep 2019 07:30:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3F1260126;
	Thu,  5 Sep 2019 07:30:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59F681802218;
	Thu,  5 Sep 2019 07:30:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x84FqM1b029512 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Sep 2019 11:52:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8CEB55D9E1; Wed,  4 Sep 2019 15:52:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86AA15D9C9
	for <dm-devel@redhat.com>; Wed,  4 Sep 2019 15:52:20 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
	[67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E06AD1DA3
	for <dm-devel@redhat.com>; Wed,  4 Sep 2019 15:52:18 +0000 (UTC)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x84FqCaF011552; Wed, 4 Sep 2019 08:52:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-id
	: content-transfer-encoding : mime-version; s=facebook;
	bh=I0EqiGf/OE+bKvwpTFSbj449/dU/+SySmyP7VJIM/7s=;
	b=UAFjtQ3Ayf4lmCqZ9vJQub90RKz40o6WXHWSKEPz4DqhH9eBfLZa1qYI0zPy4iTZ/F98
	w5424t8B+FunamAuKWPNhDR7sT8Q/aERuLMRIuhC/7RQ9MiiMgy3R+NDxmAm0kMi/A43
	BkSi+5HN4szJ5bC3viTB8KL4PnCmtPymkPI= 
Received: from maileast.thefacebook.com ([163.114.130.16])
	by mx0a-00082601.pphosted.com with ESMTP id 2usqs7e6j4-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 04 Sep 2019 08:52:15 -0700
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
	ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Wed, 4 Sep 2019 08:51:52 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.31.183)
	by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
	via Frontend Transport; Wed, 4 Sep 2019 08:51:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=NoS486xanOjRG9dU/ahr/qGmI1Yj2ZQiAk4g+HVXhlYDGpUIKKBJ0Dto4ejMtLFyRrRirzQ4HZuS8lVFI5XdvBIbY4VClqGQCErsW2oEoc8mi1o6EhPcQPhqcRaVrdJYg1KyZRoKcWHARpy7MwgUlEuL3M88CxhMeg5QzzWS8a6DBHgvscwA34w/hyzwQtFjbK30xcrPm3HFip/dFlo5WhHZGiDLbydHb/wh0CiLRD2HnEMp7NvdXJ8kzRNSO4fCv46ek4w0t2Ct7OsngcJRgq39rtouLXdHW0yuR6tSIgNdjqjnkO4BwVidwbTCqdmS3KgPxEame80/PfmQayFOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=I0EqiGf/OE+bKvwpTFSbj449/dU/+SySmyP7VJIM/7s=;
	b=AVmxsjai/7vtgoiLY/47+fk4yNqBm11UIan/Qg/I+ieUFuU1KL2mDjOix/mgBW2+owEPdhKKCovk/36dX3qeXMEKgahWibcfuLypDDdqH0A5HifaXcbQI5o6m8imTWLOw29MPW23N5QH9coFlTi3GGjutg3nkeRv8gEJzC1TFmZpSMi72IdKLyC43SQavjJ92DYpkTAqSexcpZk1/k22cb5xwufIBlSzXRpNDbRe0Zg9pjVmHnpaTRVI0QXwDG75U9UvGYSwJrIlE1U3r5nTLD6Rw3nSvnutJntRQ+tM4s7pjSJVDNgbK8C4AB+v22ivZOT4nMOU3fXR9pw/NRkbNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com;
	dkim=pass header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
	s=selector2-fb-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=I0EqiGf/OE+bKvwpTFSbj449/dU/+SySmyP7VJIM/7s=;
	b=bXK1CEer9yYPOJBboO+2GQhdqqfUmkNCj+JuCswdkaUcAX3FMD0FZi0W2Sy70yWco5yp630oHyW3GLXLsVu9bms4beC2dTMFvCfrGuJe/Y7dG+bu3Fuvkj9/soWuh8JTq61jQ8/uTAyM23Q4SGY6Tx6n0nw4Z6co+XozPYQAfnw=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
	MWHPR15MB1854.namprd15.prod.outlook.com (10.174.96.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2220.20; Wed, 4 Sep 2019 15:51:51 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::a828:5750:379d:b9a1]) by
	MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::a828:5750:379d:b9a1%8]) with mapi id 15.20.2220.022;
	Wed, 4 Sep 2019 15:51:51 +0000
From: Song Liu <songliubraving@fb.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>, Jes Sorensen
	<jsorensen@fb.com>
Thread-Topic: [PATCH v4 2/2] mdadm: Introduce new array state 'broken' for
	raid0/linear
Thread-Index: AQHVYpC9BL+movukAkyf47O/zAZ5aqcbrDIA
Date: Wed, 4 Sep 2019 15:51:51 +0000
Message-ID: <A0D1B6AB-50CF-4B38-8452-A4E18AFDC8EB@fb.com>
References: <20190903194901.13524-1-gpiccoli@canonical.com>
	<20190903194901.13524-2-gpiccoli@canonical.com>
In-Reply-To: <20190903194901.13524-2-gpiccoli@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:180::f079]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e56be0d2-07d8-42fb-2978-08d7314fcdad
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:MWHPR15MB1854; 
x-ms-traffictypediagnostic: MWHPR15MB1854:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR15MB185489B2757BAFADCC49169DB3B80@MWHPR15MB1854.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(396003)(376002)(39860400002)(346002)(189003)(199004)(50226002)(4326008)(81166006)(14454004)(7736002)(305945005)(81156014)(99286004)(6246003)(76176011)(86362001)(53936002)(229853002)(6636002)(66446008)(486006)(33656002)(316002)(476003)(14444005)(256004)(8936002)(446003)(2906002)(6486002)(54906003)(110136005)(2616005)(6436002)(6506007)(6512007)(11346002)(53546011)(57306001)(71190400001)(46003)(71200400001)(102836004)(8676002)(6116002)(66476007)(66556008)(478600001)(64756008)(5660300002)(186003)(25786009)(36756003)(76116006)(66946007)(91956017);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1854;
	H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sUiLnvFFEzs3LiNCqZDp7jqreJi97O/uGimmMu8prSQXVzMgNHwXlULM360uBX+JOm8od2B0+clH52+jfHiaXJT0d4hbZGdni9diAlnvozLvtxEuXdK8kUmRnjMrYk74C85iJRTY6+zQBGEJASGDtcrBqEaiSNpR5yIsCi28ZgNzK6oOlQU8WD9efUgsZi5BMrxSac7ECOywItoELCqSWSNbFaqAlRcxzaTZf4PdHuqJyj+1vShHlp1V/SqUZi83M9EmmIiYIQbTlY6YBQs3fb4nTkcjOHNqN1gFvXoTP7XWztUUBDl5ctuvhisMXa4GEHUq41XFRbcrmHSzF5Abr0jo7Uoq1kJcY9VNT7Co9I3399yYJAdZqLPoSgNTJeXf3NDTBlpEKCuHEeT8AsRxbZ7QRzLXxRyLGUrz6rebuEs=
Content-ID: <D616B14D23BF49478B91C4E7C7C5D6EC@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e56be0d2-07d8-42fb-2978-08d7314fcdad
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:51:51.6930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QudCIenIMf9nfb8dCggBbvoXf1rpcUp6ouRnuYcII97QL8R/Wi34dFQhrhJVUK9JnRQJvbVomgZV90P1QtTBpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1854
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
	definitions=2019-09-04_04:2019-09-04,2019-09-04 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	mlxscore=0
	mlxlogscore=955 impostorscore=0 suspectscore=0 bulkscore=0
	clxscore=1015
	lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
	spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=8.12.0-1906280000 definitions=main-1909040155
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Wed, 04 Sep 2019 15:52:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Wed, 04 Sep 2019 15:52:19 +0000 (UTC) for IP:'67.231.145.42'
	DOMAIN:'mx0a-00082601.pphosted.com'
	HELO:'mx0a-00082601.pphosted.com' FROM:'songliubraving@fb.com'
	RCPT:''
X-RedHat-Spam-Score: -0.801  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.145.42 mx0a-00082601.pphosted.com 67.231.145.42
	mx0a-00082601.pphosted.com
	<prvs=4150130aaa=songliubraving@fb.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x84FqM1b029512
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 05 Sep 2019 03:30:15 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"jes.sorensen@gmail.com" <jes.sorensen@gmail.com>,
	"nfbrown@suse.com" <nfbrown@suse.com>,
	"liu.song.a23@gmail.com" <liu.song.a23@gmail.com>,
	linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"jay.vosburgh@canonical.com" <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v4 2/2] mdadm: Introduce new array state
 'broken' for raid0/linear
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 05 Sep 2019 07:30:28 +0000 (UTC)



> On Sep 3, 2019, at 12:49 PM, Guilherme G. Piccoli <gpiccoli@canonical.com> wrote:
> 
> Currently if a md raid0/linear array gets one or more members removed while
> being mounted, kernel keeps showing state 'clean' in the 'array_state'
> sysfs attribute. Despite udev signaling the member device is gone, 'mdadm'
> cannot issue the STOP_ARRAY ioctl successfully, given the array is mounted.
> 
> Nothing else hints that something is wrong (except that the removed devices
> don't show properly in the output of mdadm 'detail' command). There is no
> other property to be checked, and if user is not performing reads/writes
> to the array, even kernel log is quiet and doesn't give a clue about the
> missing member.
> 
> This patch is the mdadm counterpart of kernel new array state 'broken'.
> The 'broken' state mimics the state 'clean' in every aspect, being useful
> only to distinguish if an array has some member missing. All necessary
> paths in mdadm were changed to deal with 'broken' state, and in case the
> tool runs in a kernel that is not updated, it'll work normally, i.e., it
> doesn't require the 'broken' state in order to work.
> Also, this patch changes the way the array state is showed in the 'detail'
> command (for raid0/linear only) - now it takes the 'array_state' sysfs
> attribute into account instead of only rely in the MD_SB_CLEAN flag.
> 
> Cc: Jes Sorensen <jes.sorensen@gmail.com>
> Cc: NeilBrown <neilb@suse.de>
> Cc: Song Liu <songliubraving@fb.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>

Acked-by: Song Liu <songliubraving@fb.com>

Jes, does this look good?

Thanks,
Song

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
