Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B38B87F620
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 13:41:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E976230821DF;
	Fri,  2 Aug 2019 11:41:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9A28600F8;
	Fri,  2 Aug 2019 11:41:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3560F264C8;
	Fri,  2 Aug 2019 11:41:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x71Mhvrb010275 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 1 Aug 2019 18:43:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4B9D60C5F; Thu,  1 Aug 2019 22:43:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCCCB60BF4
	for <dm-devel@redhat.com>; Thu,  1 Aug 2019 22:43:55 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
	[67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81DDC31303AA
	for <dm-devel@redhat.com>; Thu,  1 Aug 2019 22:43:54 +0000 (UTC)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x71MgIWW017072; Thu, 1 Aug 2019 15:43:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-id
	: content-transfer-encoding : mime-version; s=facebook;
	bh=ariXzKAInQezmuKRSY7MjObHIwxaIMDHy28ouUSmDLU=;
	b=ChPKrwqhoumWuQbgv9J4BUSlafzYdoFHFP8ArAZNTyuO4ItAsRF56444eDkazIftMndt
	t8sYY2fUxs2rh72n1LBVmdiQIU+KOXz1jmxM1gljlrVdBQH9tNz3xdfS5lUM2/rShrP7
	+2b8JXlMnCMTSuhAyYzdE7NVZyYBFMCn76g= 
Received: from maileast.thefacebook.com ([163.114.130.16])
	by mx0a-00082601.pphosted.com with ESMTP id 2u438rhfb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 01 Aug 2019 15:43:51 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
	ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Thu, 1 Aug 2019 15:43:49 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
	by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
	via Frontend Transport; Thu, 1 Aug 2019 15:43:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=JWjFmCjWpO2lDglDiGYP0TmBKEqncFNqqZXFa2BljuMVUEQ0eTfA6HUzkh5DE0PeZDW1umsiQ3lz66TG8WAYHyHBlvPbrSqiT+j/DR+kvOPj0yQqM72qNe/z00iwxqnj+Ro/9p1Y1+e93ZWm9xkoznUPHvt451r/RD5WBfBaqttmLQJ02OsPeZqKDZ3qpGcqfKzs3u8BNgstiYy92PCoIvFkBqM71JDLOSJL/QG6WUxIsZjwzJMArGQFW4OTMruTkH2ze/sgMOf8C+OIwOEqAGfzr5zncMXC/X/r63suvBgKrW40kWbOzCJYVgbbuPuCLYkgQAM0DslJLPjPsUOm7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ariXzKAInQezmuKRSY7MjObHIwxaIMDHy28ouUSmDLU=;
	b=TVW9LeICBWljGvaHabgX7FmdO6Jkf/EA1Pb2EQOPeH2NSPzZirQZt2lSeQOxLTyeOsCxzWk/XHBAWiARh1tUn+j2AMZAgQnFpmD7ZsEF1ByffAJ2zWwo9WvVpU80uVHe+N4JJdvjET2bUgnt8rtAqqeBhdWnZB8ZHvkcXQLhn6+KtwQNS7/d1EJb6flCjHqso2DctneXHcUmg3xqNFRAj+gOoPRMuwt1GAmwrsVXz55MtE/t7H3nllB5eWzNv5gkgfem7xleUKgplIQ8X1a9iOqJsIA1b9ForPiwA+uHHdeHzf9euTs4q+d+Z1jLpc9eM9EiNX4ysz/mto+Qk6JG+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com;
	dkim=pass header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
	s=selector2-fb-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ariXzKAInQezmuKRSY7MjObHIwxaIMDHy28ouUSmDLU=;
	b=OgZ0Nt7glzUtmu5hJtkfYio7B4rfKYjUxIMFig7IC1Y6Ipi96Mehlg/V/oJkPuNBsgREJs9UNa6GnKK2nOUJ1t5kk0JvStzs64R/pAhwOq3D+CUOxC55z89I7jkY3LYJXH8hcZ2Cu6JQel8qjqMABNfx+iWmRcI3ypAFhtclTTc=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
	MWHPR15MB1470.namprd15.prod.outlook.com (10.173.234.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2115.15; Thu, 1 Aug 2019 22:43:48 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::d4fc:70c0:79a5:f41b]) by
	MWHPR15MB1165.namprd15.prod.outlook.com
	([fe80::d4fc:70c0:79a5:f41b%2]) with mapi id 15.20.2115.005;
	Thu, 1 Aug 2019 22:43:48 +0000
From: Song Liu <songliubraving@fb.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Thread-Topic: [PATCH] md/raid0: Fail BIOs if their underlying block device is
	gone
Thread-Index: AQHVRkSmX2LKohDHxE6edwD68oSJQqbiSV6AgADPP4CAAg5UgIAAALGAgAGbKgCAACXTgA==
Date: Thu, 1 Aug 2019 22:43:48 +0000
Message-ID: <72C166DF-3984-4330-8C60-BBDA07358771@fb.com>
References: <20190729193359.11040-1-gpiccoli@canonical.com>
	<87zhkwl6ya.fsf@notabene.neil.brown.name>
	<6400083b-3cf3-cbc6-650a-c3ae6629b14c@canonical.com>
	<CAPhsuW69YrpHqBCOob2b5wzzWS9FM087sfe3iC0odX8kZWRwmA@mail.gmail.com>
	<CAPhsuW5zB=Kik4rq9YA-xBer7Z-h-23QV4WSCWe-jvhFgGc0Cw@mail.gmail.com>
	<9674ca8f-4325-3023-8a1d-39782103f55d@canonical.com>
In-Reply-To: <9674ca8f-4325-3023-8a1d-39782103f55d@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:33d7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8925af17-cb67-48da-ebf9-08d716d1b7d7
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:MWHPR15MB1470; 
x-ms-traffictypediagnostic: MWHPR15MB1470:
x-microsoft-antispam-prvs: <MWHPR15MB1470586DC779D5DCC7B359C1B3DE0@MWHPR15MB1470.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(376002)(366004)(39860400002)(346002)(199004)(51914003)(189003)(8936002)(46003)(33656002)(316002)(81156014)(50226002)(229853002)(76176011)(8676002)(71200400001)(7736002)(54906003)(71190400001)(14454004)(25786009)(5660300002)(81166006)(99286004)(478600001)(2906002)(256004)(6116002)(86362001)(6512007)(14444005)(6436002)(36756003)(6916009)(68736007)(102836004)(446003)(305945005)(4326008)(53936002)(11346002)(66946007)(64756008)(57306001)(2616005)(66446008)(66476007)(66556008)(186003)(53546011)(476003)(6486002)(76116006)(6246003)(486006)(6506007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1470;
	H:MWHPR15MB1165.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KEdxwBjDBL04+MJv/m/8huFynbj0Hc2huJtSZtGZUNj5Oj4AbpdxxuIlqOTEDgwLjIFzr7rtdLXgkhD3JuzDBqMf6TQnvkJev0o80tpHOEEnTfKkyhsSbMTmBffIgSjXf37YSQ3XYU8Sdt2CpjP+9F4Zak/H55QllvPMlzDNNQ4/ShlRaZpUM/mzv0ZNi5a5AaZU1C8GwuNU+xU1bghOvjBL1WYnzCyFs0BfEt6KBoNmn6dX6uamVWic56HvZK5iUyeZbPqalV4VM7Km23J0lvVjtjOqxi7Vz9y6cloNM3zB1tSnH82aDJEqrRXxc2O53+ujvglIWDbkv3wF5OC+SkeTewIwyPi8A/zXInWky7ChOKzqtV783PZxTA3Jl/YJmHB7njLCogAgIwk+d7K9QNGdRTE8epjadL1mIgOh9GI=
Content-ID: <1DB28A5D09FE504C800002670C1FD648@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8925af17-cb67-48da-ebf9-08d716d1b7d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 22:43:48.2289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: songliubraving@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1470
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-08-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1906280000 definitions=main-1908010239
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Thu, 01 Aug 2019 22:43:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Thu, 01 Aug 2019 22:43:54 +0000 (UTC) for IP:'67.231.145.42'
	DOMAIN:'mx0a-00082601.pphosted.com'
	HELO:'mx0a-00082601.pphosted.com' FROM:'songliubraving@fb.com'
	RCPT:''
X-RedHat-Spam-Score: -0.8  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.145.42 mx0a-00082601.pphosted.com 67.231.145.42
	mx0a-00082601.pphosted.com
	<prvs=3116992784=songliubraving@fb.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x71Mhvrb010275
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 02 Aug 2019 07:39:28 -0400
Cc: Neil F Brown <nfbrown@suse.com>, Song Liu <liu.song.a23@gmail.com>,
	NeilBrown <neilb@suse.com>, linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH] md/raid0: Fail BIOs if their underlying
 block device is gone
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 02 Aug 2019 11:41:45 +0000 (UTC)



> On Aug 1, 2019, at 1:28 PM, Guilherme G. Piccoli <gpiccoli@canonical.com> wrote:
> 
> 
> 
> On 31/07/2019 16:56, Song Liu wrote:
>> On Wed, Jul 31, 2019 at 12:54 PM Song Liu <liu.song.a23@gmail.com> wrote:
>>> 
>>> On Tue, Jul 30, 2019 at 5:31 AM Guilherme G. Piccoli
>>> <gpiccoli@canonical.com> wrote:
>>>> 
>>>> On 29/07/2019 21:08, NeilBrown wrote:
>>>>> [...]
>>>>>> +    if (unlikely(test_bit(MD_BROKEN, &mddev->flags))) {
>>>>>> +            bio_io_error(bio);
>>>>>> +            return BLK_QC_T_NONE;
>>>>>> +    }
>>>>> 
>>>>> I think this should only fail WRITE requests, not READ requests.
>>>>> 
>>>>> Otherwise the patch is probably reasonable.
>>>>> 
>>>>> NeilBrown
>>>> 
>>>> Thanks for the feedback Neil! I thought about it; it seemed to me better
>>>> to deny/fail the reads instead of returning "wrong" reads, since a file
>>>> read in a raid0 will be incomplete if one member is missing.
>>>> But it's fine for me to change that in the next iteration of this patch.
>>> 
>>> For reads at block/page level, we will either get EIO or valid data, right?
>>> 
>>> If that's not the case, we should fail all writes.
>> 
>> Oops, I meant all _reads_.
> 
> Hi Song, thanks for the feedback! After changing the patch and testing a
> bit, it behaves exactly as you said, we got either valid data read from
> the healthy devices or -EIO for the data tentatively read from the
> failed/missing array members.

Thanks for testing this out. 

> 
> So, I'll resubmit with that change. Also, I've noticed clearing the
> BROKEN flag seem unnecessary, if user stops the array in order to fix
> the missing member, it'll require a re-assembly and the array is gonna
> work again.
> 
> Do you / Neil considers this fix relevant to md/linear too? If so, I can
> also include that in the V2.

Yes, please also include fix for md/linear. 

Song

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
