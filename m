Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 4825E190409
	for <lists+dm-devel@lfdr.de>; Tue, 24 Mar 2020 05:02:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585022519;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=i2r4AnC0kcjh3t9oXR+yhSFuDLJMNAd2mjYiz0AH8Yk=;
	b=Z16hkb6/gHhiYPMhtIMIO591j219plIomtBmSxhnLvl+w3bld817GN7RGdrTRVGeNwFjje
	TjQh89eaeQkFyTnnAr0T02oiLy7cMpU3ZYnhCMp+Bu0lGKg1GLJ//sE1LL/8HTEYhXh320
	dreHHoqELGSD/LUh5jWOYIVfVCstu4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-Z3KLTQ7kMl2abPBWjYF2Iw-1; Tue, 24 Mar 2020 00:01:56 -0400
X-MC-Unique: Z3KLTQ7kMl2abPBWjYF2Iw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 446A78018A2;
	Tue, 24 Mar 2020 04:01:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1332A6EF8A;
	Tue, 24 Mar 2020 04:01:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D949E86380;
	Tue, 24 Mar 2020 04:01:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02O41hZd026154 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 00:01:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0BC7910AF9D8; Tue, 24 Mar 2020 04:01:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06FB310AF9D5
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 04:01:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 444501019E0F
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 04:01:40 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-476-ubqEVYsWMiqnKfBvom6EUQ-1; Tue, 24 Mar 2020 00:01:37 -0400
X-MC-Unique: ubqEVYsWMiqnKfBvom6EUQ-1
IronPort-SDR: yVy784FqHPyjiRk1pK8rXL7lMhnI+P5eTaX7jg1/W9vzOwh7PfVQJr+YXmDCYkhHXNSNDpSkJJ
	H+6IwX7ZcK6TyNVL8sLixKc1nWPZPxrPo3+z4YG0HrbJeqonc8eS/QXNrMjD3kuNVRCBXOpdqs
	WuPOH2EvrjTaWfngdrk9/Z8ithab4WmFmTpsdJsNLqWUD/tRUZhO/G6PzzE0SKVR9oavMEkF3X
	5rpcglL7eGnKLafLGLktLDGnZ86qGThTnra1nQ5lu6ta1/FPJBHvBdS3brkA4tgrElWL8xCimF
	PSE=
X-IronPort-AV: E=Sophos;i="5.72,298,1580745600"; d="scan'208";a="241784324"
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
	by ob1.hgst.iphmx.com with ESMTP; 24 Mar 2020 12:01:36 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2264.namprd04.prod.outlook.com (2603:10b6:102:15::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20;
	Tue, 24 Mar 2020 04:01:35 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2835.021;
	Tue, 24 Mar 2020 04:01:35 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 2/2] dm-zoned: add 'status' and 'message' callbacks
Thread-Index: AQHWASRN+EEVtcKBDE65eYGek1Z9Uw==
Date: Tue, 24 Mar 2020 04:01:35 +0000
Message-ID: <CO2PR04MB2343C57FF66849427AE3098EE7F10@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200323150352.107826-1-hare@suse.de>
	<20200323150352.107826-3-hare@suse.de>
	<CO2PR04MB23435B2F65967957A5055580E7F10@CO2PR04MB2343.namprd04.prod.outlook.com>
	<20200324035945.GF30700@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b65f0188-2d0f-4509-0755-08d7cfa80bce
x-ms-traffictypediagnostic: CO2PR04MB2264:
x-microsoft-antispam-prvs: <CO2PR04MB2264CD1EB2464CF243A03217E7F10@CO2PR04MB2264.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(8936002)(7696005)(54906003)(5660300002)(186003)(6506007)(8676002)(26005)(316002)(53546011)(81156014)(86362001)(4744005)(2906002)(81166006)(15650500001)(9686003)(6916009)(91956017)(55016002)(4326008)(478600001)(52536014)(66446008)(71200400001)(33656002)(66556008)(66476007)(76116006)(64756008)(66946007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2264;
	H:CO2PR04MB2343.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B//AqSMYQuByn42HQrChmrAaqPQ4fSa8HN9wiFiUSW1d4apOJ2alYuE2Ld+snm/a80zcF9in+bcc7UJ+CGgwDYjCNJimOXkuMszf9nW0uIRlNY6SR5A4GgEMigfTo5E1N0r776D73fezk0MqJiTPaKRFr329M8FAD4x5bL46r9bGUj5ALYRUfL9A9GYrmFl5gNBAXrVj40bQYSwzm0vQQwl2XYaXfY14ZALoaLeMwdBVzqedscJUHnlw5U7Jy5gM1jt3rIcirH60y/Idn4Sguqf2mSw+TMWpTKfzoyiRVZOQaE80Tc+/+WMzbdRqmf+Ja2V4KaNelptc4jjv43SJ5gJpiAAEno6vntiSlgnkbKNQHUBWfZcJwBzJz1+WzL0JznodvUNpkQpSgAM04Iz+glidpWbUcP5Zeq2zth076iQi7kx2U79aS2mEXPedHWYe
x-ms-exchange-antispam-messagedata: 87Hp2AloYuhBzV+xV6a/ylqoppJTfq8Tcdq/sYjzHG1G/iMr1ysN08azNTudeiRurWOdbAIF5rSJQm+5pNZhAjoKrh1npOdUBbJ7uY06mTL8PNbFJXlnY2Z/kLcK/jL8X3cVRW0WNpHDL4j1KTJKEw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65f0188-2d0f-4509-0755-08d7cfa80bce
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 04:01:35.4512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mla+EQyXFs3HxIOqZ9Isa7ZkJn1hBoTdmfU7RsdWDh+yDeGQIpIuSwRol7Um1EDiIMu3XYlC824vJvC9oTb1pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2264
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02O41hZd026154
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Johannes Thumshirn <jth@kernel.org>
Subject: Re: [dm-devel] [PATCH 2/2] dm-zoned: add 'status' and 'message'
	callbacks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/03/24 13:00, Mike Snitzer wrote:
> On Mon, Mar 23 2020 at 11:54pm -0400,
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> 
>> On 2020/03/24 0:04, Hannes Reinecke wrote:
>>> Add callbacks to supply information for 'dmsetup status'
>>> and 'dmsetup info', and implement the message 'reclaim'
>>> to start the reclaim worker.
>>
>> This one is nice ! Can you send it out minus the cache changes ? We can use it
>> with unmodified dm-zoned :)
> 
> Yeah, I'm kind of stunned dm-zoned's lack of .status went unnoticeed
> until now ;)

My fault. I didn't notice that such feature existed in dm !
Sometimes I miss the most obvious :)

> 
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

