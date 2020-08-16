Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9F192245CC5
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 09:01:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-uJLJ4CdPNASCD2Wr1Hsm4g-1; Mon, 17 Aug 2020 03:01:11 -0400
X-MC-Unique: uJLJ4CdPNASCD2Wr1Hsm4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E1B71014DF6;
	Mon, 17 Aug 2020 07:01:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 394625D9D2;
	Mon, 17 Aug 2020 07:01:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3ADA4EE36;
	Mon, 17 Aug 2020 07:01:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07G2W7Zb029328 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 15 Aug 2020 22:32:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 369F72156A4C; Sun, 16 Aug 2020 02:32:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6C5C2157F4A
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 02:32:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 169C3185A78B
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 02:32:03 +0000 (UTC)
Received: from vic-MTAout1.csiro.au (vic-mtaout1.csiro.au [150.229.64.37])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-91-unmpInuzP0GxQg8tQOyLoA-1; Sat, 15 Aug 2020 22:31:59 -0400
X-MC-Unique: unmpInuzP0GxQg8tQOyLoA-1
IronPort-SDR: OWM+TPuoJgLa3aM30piXikiN5yQWWm/ZdEBl1uxF66mXjESQ5/bEWyWjxSGcirhQhKFmzPTnPB
	lqwNxOl2+fMg==
X-SBRS: 4.0
IronPort-PHdr: =?us-ascii?q?9a23=3A2ICsyR23RnMhmAwUsmDT+zVfbzU7u7jyIg8e44?=
	=?us-ascii?q?YmjLQLaKm44pD+JxWGvqdiiVbIWcPQ7PcXw+bVsqW1X2sG7N7BtX0Za5VDWl?=
	=?us-ascii?q?cDjtlehA0vBsOJSCiZZP7nZiA3BoJOAVli+XzoPk1cGcK4bFrX8TW+6DcIEU?=
	=?us-ascii?q?D5Mgx4bu3+Bo/ViZGx0Oa/s53eaglFnnyze7R3eR6trB/W8MAL0oY=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A+FeAwCQmThfjACwBSSYiIBxAISUgiF?=
	=?us-ascii?q?fHQEBAQEJARIBBQUBQIFKgVIpKGIVgTMKhC2DRgONXJs8Axg9CwEBAQwCJQg?=
	=?us-ascii?q?CBAEBAoRKAheCMQIkOBMCAwEBCwEBBgEBAQEBBgQCAhABAQEmhgwMg1NGPQE?=
	=?us-ascii?q?BAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCDVQrHgEBHgE?=
	=?us-ascii?q?BAQMSEREMAQE3AQ8CAQgYAgImAgICEh4VEgQOJ4MEAYJLAy0BAQQKqCQCgTm?=
	=?us-ascii?q?IYAEBdYEygwEBAQWBMwGECxiCDgMGCQGBBCqCcYNghkyBXT6BEAGDED6CXAE?=
	=?us-ascii?q?DgV2DFzOCLY9uCiOCaKMwBwMggkKaEQINIYMAnSGUJZ1TAgQCBAUCDgEBBYF?=
	=?us-ascii?q?qgXtsgz1QFwINjh8agQsBAYJKilZ0NwIGCgEBAwl8jwQBgRABAQ?=
X-IPAS-Result: =?us-ascii?q?A+FeAwCQmThfjACwBSSYiIBxAISUgiFfHQEBAQEJARIBB?=
	=?us-ascii?q?QUBQIFKgVIpKGIVgTMKhC2DRgONXJs8Axg9CwEBAQwCJQgCBAEBAoRKAheCM?=
	=?us-ascii?q?QIkOBMCAwEBCwEBBgEBAQEBBgQCAhABAQEmhgwMg1NGPQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCDVQrHgEBHgEBAQMSEREMAQE3A?=
	=?us-ascii?q?Q8CAQgYAgImAgICEh4VEgQOJ4MEAYJLAy0BAQQKqCQCgTmIYAEBdYEygwEBA?=
	=?us-ascii?q?QWBMwGECxiCDgMGCQGBBCqCcYNghkyBXT6BEAGDED6CXAEDgV2DFzOCLY9uC?=
	=?us-ascii?q?iOCaKMwBwMggkKaEQINIYMAnSGUJZ1TAgQCBAUCDgEBBYFqgXtsgz1QFwINj?=
	=?us-ascii?q?h8agQsBAYJKilZ0NwIGCgEBAwl8jwQBgRABAQ?=
Received: from exch1-mel.nexus.csiro.au ([IPv6:2405:b000:302:71::85:121])
	by vic-ironport-int.csiro.au with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	16 Aug 2020 12:30:46 +1000
Received: from exch3-mel.nexus.csiro.au (2405:b000:302:71::85:123) by
	exch1-mel.nexus.csiro.au (2405:b000:302:71::85:121) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Sun, 16 Aug 2020 12:30:45 +1000
Received: from exedge2.csiro.au (150.229.64.34) by exch3-mel.nexus.csiro.au
	(138.194.85.123) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via
	Frontend Transport; Sun, 16 Aug 2020 12:30:45 +1000
Received: from AUS01-SY3-obe.outbound.protection.outlook.com (104.47.117.58)
	by exedge2.csiro.au (150.229.64.34) with Microsoft SMTP Server (TLS) id
	15.0.1497.2; Sun, 16 Aug 2020 12:30:39 +1000
Received: from MEAPR01MB4517.ausprd01.prod.outlook.com (2603:10c6:220:3c::18)
	by ME2PR01MB2356.ausprd01.prod.outlook.com (2603:10c6:201:19::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16;
	Sun, 16 Aug 2020 02:30:44 +0000
Received: from MEAPR01MB4517.ausprd01.prod.outlook.com
	([fe80::80c9:72d0:91b9:8d4e]) by
	MEAPR01MB4517.ausprd01.prod.outlook.com
	([fe80::80c9:72d0:91b9:8d4e%7]) with mapi id 15.20.3283.024;
	Sun, 16 Aug 2020 02:30:44 +0000
From: "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Thread-Topic: [dm-devel] Promise and ALUA
Thread-Index: AQHWbs9fLG+eDTnEKkiNCju3lFnLRak2fTaAgABHy/aAAB/NgIACxTAAgABi1wA=
Date: Sun, 16 Aug 2020 02:30:43 +0000
Message-ID: <20200816023037.GA13633@mayhem.atnf.CSIRO.AU>
References: <20200810043316.GH21810@mayhem.atnf.CSIRO.AU>
	<8c910ecb-ddf8-0a91-4310-4daedb85cd89@gmail.com>
	<20200813235143.GB2644@mayhem.atnf.CSIRO.AU>
	<f9f8c62f-fa97-dbcb-52dd-503d392df95f@gmail.com>
	<20200814021835.GD2644@mayhem.atnf.CSIRO.AU>
	<30d53099-24dd-254a-13f2-9f1a488c1773@gmail.com>
In-Reply-To: <30d53099-24dd-254a-13f2-9f1a488c1773@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [130.155.194.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0fd902f-8986-4798-ab82-08d8418c606f
x-ms-traffictypediagnostic: ME2PR01MB2356:
x-microsoft-antispam-prvs: <ME2PR01MB235605FA45AC50FD873D561EF45E0@ME2PR01MB2356.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ffngQUOIs8MHFHlF8zq2vkfOP/aXKDCkaz9hy5iMkJ6RYgsXc+KMYbZ2NHM7ALYnzrXlGjXt/so02W0HjmEUn5rmarKTPTuNF9Z3wOHG7kJsqozbISxWeFnZeKwJJVqfS02z8eidatuH/RtTNE4AX017A7JWQlfFc7NYt2vLtxqzhtKJypXfj28ECXa9VVgwHBzm8MKXg1vG/qSLPV26bQN5ovwlm4cMZausnOCFj2wpQD/U/IF2VsK7E6syABk7VEekWTgxDh4zzvrhf5iq75fzYXcfpokQCk3SzPtxl0y2UnCdKRCU7N3kIO7oIDEQI4HCcwkDHJMo3WvspbotOPN2QQkVBnfjKMZlwe+kZNISvakW+e+Xhfyz5iJ5dbm8/qe66/cbyxaIPZ5B9hPP8g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MEAPR01MB4517.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(136003)(346002)(366004)(396003)(39850400004)(376002)(6916009)(2906002)(478600001)(86362001)(966005)(8676002)(71200400001)(316002)(33656002)(26005)(1076003)(66556008)(6512007)(5660300002)(6486002)(91956017)(76116006)(186003)(66946007)(8936002)(83380400001)(66476007)(6506007)(4326008)(66446008)(64756008);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: 8LwTbsZmzKN6jSO2k3k+ZxAbOmMv0mSnJdqYPpNLO7JqkSQt88CQnRGeZqy6qiVSvO25uKab0QBjq0VqlI4xRRQC/QID77v12lM5JkqNUtadVaL4ZDBbJ+1PZfCH59qGmzMSmrJAdC6BW8INVrxm38GQkx6W+1ry/R0FCApScKOQdSMKYIQgvHtcVhmM+hnu1rTP6Pl/D3eSvIvb2uUaJrUd6PS3SCmt+6Qc4dagID61RzgyakRYAzm6tRC4usi6FqSXAao+IODnATHpl3Rvdx9clEHn5O61o6sQmHyi929WxObzdu+LqndovUZLeQlyj5vN1w4y2Xke60RDHMpDmM9FrqJEk5uCV/a4895bjAyLxb09hHYmTEltRfNsKHaYV7rJJ8pT7IlwOUQuPqH9e/kGSFI3J+jZZTfCxRz+LTzvZuRTBsSBQXRFX0CNjMEcRSyXvUxXBj9M7XspkwscLQMG6tGfpWdBIfFqxsdDrfaIXyfc5IYQoESOq4LSt03Ujmospgp7v0kquSgdYGExyKeQ94f8INB3VtuTprfI1XBP0KiE/UAVhPEtntG+YkB1edS+dSJSoAyGvDbW6fJC4aI6ItmoOO4QGuxWuLDtXf615uvLRzZzyQMRgzaz1XtGeggZ7vQ+6S9XmaUc6bYiDw==
x-ms-exchange-transport-forked: True
Content-ID: <6D588B6AD3CABD418084F22E2995AF86@ausprd01.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEAPR01MB4517.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fd902f-8986-4798-ab82-08d8418c606f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2020 02:30:44.0414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fe05593-19ac-4f98-adbf-0375fce7f160
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xyj/CbDs5X5dU5uOoCo9KCMrTjXOsUyypfJUPxlgRKc92r+padWRcqm+r6fhEFm4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2PR01MB2356
X-OriginatorOrg: csiro.au
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07G2W7Zb029328
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 17 Aug 2020 03:00:28 -0400
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] Promise and ALUA
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 15, 2020 at 10:36:52PM +0200, Xose Vazquez Perez wrote:
>On 8/14/20 4:18 AM, McIntyre, Vincent (CASS, Marsfield) wrote:
>
>>This is the device section I had before for the Promise
>>         device {
>>                 vendor "Promise"
>>                 product "VTrak"
>>                 product_blacklist "VTrak V-LUN"
>                   path_grouping_policy "multibus" <---------
>>                 path_selector "service-time 0"
>>                 path_checker "tur"
>                   prio "alua"                     <---------
>>                 failback "immediate"
>>                 no_path_retry 30
>>         }
>>The only real differences are the prio and failback.
>
>"multibus" and "prio alua" are incompatible!

Promise recommend the multibus option,
prio alua was introduced by me messing about.

So a compatible configuration would be either what Promise recommend

  detect_prio          no       #not explicit, implied by prio const
  prio                 const
  path_grouping_policy multibus
  failback             immediate
  hardware_handler     "0"

or (with alua support enabled, the multipath-tools defaults)

  detect_prio          yes
  prio                 alua
  path_grouping_policy group_by_prio
  failback             manual
  hardware_handler     "1 alua"

?

>From your tests and Promise docs, it looks like it's an Active-Passive array
>with ALUA support.
>It should use latest firmware [1]. And ALUA must be enabled to get the best
>performance and stability.
>Otherwise, the array will work with only one path per LUN.
>[1] https://www.promise.com/Support/DownloadCenter/VTrak/Ex30/E830f#Firmware
>
>The multipath-tools default settings is already optimized for the ALUA config.

Thanks for your analysis. The model is VTrak E830f (VTE830fD).
The unit is definitely set to active-active controllers.
The firmware could use an update however, the latest release
seems to have been overlooked. I'll try updating and look
into enabling ALUA support.

One question about the man page though.
it seems from the current text that putting
  hardware_handler     "0"
in the config would be ignored for arrays that are
assumed to have ALUA support.
However if the array has ALUA support turned off and
multipathd detects this, then the package falls back to using
  hardware_handler     "0"
of its own accord?
If that's correct, could that be added to the man page?

Cheers
Vince

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

