Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 97DE5221831
	for <lists+dm-devel@lfdr.de>; Thu, 16 Jul 2020 01:05:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-H280g0B_N_C47cbxAnEwFQ-1; Wed, 15 Jul 2020 19:05:01 -0400
X-MC-Unique: H280g0B_N_C47cbxAnEwFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3492F800C64;
	Wed, 15 Jul 2020 23:04:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE05477896;
	Wed, 15 Jul 2020 23:04:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C965A72F5F;
	Wed, 15 Jul 2020 23:04:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06FN3vxT006101 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 19:03:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 22F5010064F4; Wed, 15 Jul 2020 23:03:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DEAF1006EB8
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 23:03:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4DAF185A797
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 23:03:54 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-458-aoQbBKkaNj2tkkx7jNXkWg-1; Wed, 15 Jul 2020 19:03:49 -0400
X-MC-Unique: aoQbBKkaNj2tkkx7jNXkWg-1
IronPort-SDR: hCqzrtGS+z5z7k77JUw/uImiNkRjq8qwnlcSJiT+jhNevMx7DrxgYay6pbFTGkCo8DvcqUTyYP
	L3nqMWIzVon6FYe+kbJBtTdLvV/KoBf55nV3UVfODLVwQM5VmRFpR3/sJreF00030UBVln3wTd
	SNN06tNrfJ0WWAbCEkdQ3lMvlELznTPSrVjhOV8Fzq23praK3Km33umISjdmc4rJn4TnoUJrEH
	if+bbNRShkIO02kd/PZaUVpC5q8fO4YtcBb8JN7wQnTCP564hXrNbCUt4ekl08gv9t7YpBTXJN
	YtQ=
X-IronPort-AV: E=Sophos;i="5.75,357,1589212800"; d="scan'208";a="142552869"
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
	by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 07:03:47 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1031.namprd04.prod.outlook.com (2603:10b6:910:51::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22;
	Wed, 15 Jul 2020 23:03:45 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0]) by
	CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3174.022;
	Wed, 15 Jul 2020 23:03:45 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 0/8] Various cleanups
Thread-Index: AQHWWo2iQoVnw0W3Z0WYv1DzjLHBDw==
Date: Wed, 15 Jul 2020 23:03:45 +0000
Message-ID: <CY4PR04MB3751202E2351F979BA07899EE77E0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200715095217.441885-1-damien.lemoal@wdc.com>
	<20200715134258.GB9501@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 54deffe8-50c3-40de-4169-08d829135360
x-ms-traffictypediagnostic: CY4PR04MB1031:
x-microsoft-antispam-prvs: <CY4PR04MB10318AA39CEF7A2D62396747E77E0@CY4PR04MB1031.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zClSKWk2uUQpU+GhZFW7kZWWUsURPVqv72/cGTM4ireKT0VsPAT+n4ds9jGE4EmMeVcR6sI3q4UXif7+aZocIq0MgdeFJb4wEakcE3auWvjZMfrg9UKLJynjRhAveIBZREVTPxcMMCJSQhuSzmHTy3vXxI61XRrWf4QvrX6Sd04k9TJYOOJdtJLFFd5OWQWDKfkr22axFwfOYjC0WUGwKHY3IyeePn1bgPKVehRJ6ZT79aT6o0Z31mza0PisJdLustMaTPS3zv0jbobvmfh1x6ElqQEFIMIxJT7kCarHRNNjB9X2vFNPxKY9Vq3TWQSdixniy6lAQXQICFI2vSyeYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(4326008)(66446008)(9686003)(52536014)(6916009)(186003)(55016002)(5660300002)(53546011)(66946007)(83380400001)(6506007)(2906002)(26005)(8676002)(91956017)(7696005)(316002)(66476007)(71200400001)(478600001)(64756008)(76116006)(33656002)(450100002)(66556008)(86362001)(8936002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: d7r9vd8ZSpQo+MsLnLWH6qbTO3I+1ln9jovizBhHhUd+3zrtlnmrI9uauMWf5y74iJ6JIjjnJazBWZnFuksjtQ5G7PHFzPWhaAAgbxkwoq9L6EYhFoqUxEwjaGHpRZWs1jdttwHvWUwAOw6NELTfEBRlQ/QxxBtjLulWowQlsCl8BnsNzrl6uL0Ey6GuOcirtwug8cS72J2hoNaq9WwhHvDD2eVz+i7U39V3ZHSekMMHGF1/4DX6o/oaBQAIulSOudA43uCwaPSgl2Oa/F+xBkg57aKWj7n1HLu7StVWI576hUL/qChfzyvgOtbVWmxJmtSJWTnKWrdx8fm5MVPk4hCQp+htt5YQJTzDWYrsQBVvfqU7Uyc+8AO7X34zzVwb2r14nwuZk0r61RI9RwcYxfpXp/X4uuxQlo38pHg5+G0lqDcSXvuqvCzC9RZD6D4VisaA3/HmNz6LakmDAImIwtaDh5m4FlNmlTPtan7Ukx6C5HmHf3rHN/SuwBWBteWv
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54deffe8-50c3-40de-4169-08d829135360
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 23:03:45.1950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zfWIpUDtsGwvSP5hMR8A1dAfN1xWiPUpQN79Xn3o01Cg6eV4ieReWm3ARwNWqJyH7qX0xXlWxRBg7Ktj2y87Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1031
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06FN3vxT006101
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/8] Various cleanups
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/07/15 22:43, Mike Snitzer wrote:
> On Wed, Jul 15 2020 at  5:52am -0400,
> Damien Le Moal <damien.lemoal@wdc.com> wrote:
> 
>> Mike,
>>
>> These patches fix various compilation warnings showing up when compiling
>> with W=1. The last patch addresses a static checker warning (C=1
>> compilation). There are a lot more of these code checker warnings
>> remaining that probably could be addressed, some seem to be false
>> positive though.
>>
>> Damien Le Moal (8):
>>   dm raid5: Remove set but unused variable
>>   dm raid5: Fix compilation warning
>>   md: Fix compilation warning
>>   dm raid10: Fix compilation warning
>>   dm verity: Fix compilation warning
>>   dm raid: Remove empty if statement
>>   dm ioctl: Fix compilation warning
>>   dm init: Set file local variable static
>>
>>  drivers/md/dm-init.c              |  2 +-
>>  drivers/md/dm-ioctl.c             |  2 +-
>>  drivers/md/dm-raid.c              |  2 --
>>  drivers/md/dm-verity-verify-sig.h | 14 +++++++-------
> 
> OK, thanks.
> 
>>  drivers/md/md.c                   | 12 ++++++------
>>  drivers/md/raid10.c               |  4 ++--
>>  drivers/md/raid5-cache.c          |  4 +---
>>  drivers/md/raid5.c                | 12 ++++++------
> 
> But these need to be routed through the MD.

Oops. Yes ! Will do. Thanks !

> 
> Mike
> 
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

