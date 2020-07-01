Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 89A4621030B
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 06:38:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-ksJeiuLSOaikndf4ycqgjw-1; Wed, 01 Jul 2020 00:38:50 -0400
X-MC-Unique: ksJeiuLSOaikndf4ycqgjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C1E5107ACCD;
	Wed,  1 Jul 2020 04:38:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 444655BAC8;
	Wed,  1 Jul 2020 04:38:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD9C26C9C4;
	Wed,  1 Jul 2020 04:38:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0614cJAt006945 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 00:38:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9680120230A9; Wed,  1 Jul 2020 04:38:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71319200A7A2
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:38:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4AD4185A78B
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:38:13 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-473-1BdthCLYPseP8FiStsbN0Q-1; Wed, 01 Jul 2020 00:38:11 -0400
X-MC-Unique: 1BdthCLYPseP8FiStsbN0Q-1
IronPort-SDR: axc3RkBYRAg3TJB/tMWWDX8O4E4+lMZp5qYDKOIf4HkyXO/JyoOSf/uKY0bJqZQ0Sm7sewJ1Id
	u+N1i4Lcsley+zYyQROiYxRtRKwqEEBIa3bdgQ5Dp6kG0kIxL/h0Vy9Ic6O6log128NCAtsrZ6
	ctbhIIzosFtc2+rmiijsXEZNba8ykEAIoiRmN6/BOLCgaYBPOunel5Es8cdWvTSK63H1ZkV2/X
	F9YWlcg9VtSsev3oLvQmuSb/gucKDbrZbsEjOgIpUHCOSLSxyr/UosIjwO6kQUvNnzHgZyXyMf
	owI=
X-IronPort-AV: E=Sophos;i="5.75,298,1589212800"; d="scan'208";a="141341370"
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
	by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2020 12:38:07 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
	by BY5PR04MB7124.namprd04.prod.outlook.com (2603:10b6:a03:22f::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26;
	Wed, 1 Jul 2020 04:38:06 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6]) by BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6%7]) with mapi id 15.20.3131.027;
	Wed, 1 Jul 2020 04:38:06 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 07/11] block: get rid of blk_trace_request_get_cgid()
Thread-Index: AQHWTm84FlMKKV+6yUGdr+czU/8ecQ==
Date: Wed, 1 Jul 2020 04:38:06 +0000
Message-ID: <BYAPR04MB49653ABB3E50A7D034BE8C68866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-8-chaitanya.kulkarni@wdc.com>
	<20200630051202.GD27033@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eb0e34fc-76a2-407e-8989-08d81d788cb0
x-ms-traffictypediagnostic: BY5PR04MB7124:
x-microsoft-antispam-prvs: <BY5PR04MB7124ECA0F5D878AE7F8D14CF866C0@BY5PR04MB7124.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DyuroORz/6UFiqWUMbVDWCBGHMIluHUZeOCIp6HXGuPIZxAYmbTQltUBUhLLl0JOLlSOc3yjjxlcpRxiFvCfuV57iRplDvBV2QyOe+89rNbyQ4z15IHbrR19tND3sKgYyO3b1wpU7w9YWBTwkdCJcOHtMMw1Y+8UdLLuDY/TtzZQ7CngJCziqOdTNkCAgJ/M/UuPkc9+WQWS7ccVZBuAPnHdn8qh57T3XEsjoQRzYv5nMb0/svqsAK4svZ+1TQEolD1ZtOyggNwmVCZMMGT4vbwHqwgPXzdMxC3zsCxTsUwrW+mI/yjyz0vcM/WYSKs2pISKUdSG/rnQ8SgMKO8mKbdtXtelu+llfkZh9+hfKEChlemNde3t35XiPN0w+p7d
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(6506007)(8676002)(316002)(53546011)(186003)(4326008)(26005)(6916009)(71200400001)(54906003)(52536014)(33656002)(4744005)(83380400001)(5660300002)(8936002)(76116006)(86362001)(64756008)(66446008)(66556008)(478600001)(66476007)(7416002)(55016002)(7696005)(66946007)(9686003)(2906002)(26583001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: c/d2wqIC+ahUcniLnB7gLJRZ2vvBqzCVbFfN6/aKswZJJwLvhQjC3bRHKTVdxqj1Y17ysOZqW1asgSg+kbB0fqC628GOw0xbZ9GmYS7QkYhjuwJJBSCNZm5kJj49uiWO0xXUWxCWSr8zfJz/pwC9h7JVzNuLE/OJtyjERChHlmaIT+qhlHmrgwKK/CcYlvV9p/EcgwfPQxhfNs2Z0ScVMoWDvJ3QWr3JdI/m2gt7uXkqEwNY98LiGUOPTQMDq5zI3sxXUGt5J5J0qetijJVMVXQEiwQRLqu/mBf6RXoEaYtb+7OAEHETjd1SKrmMFlR9IKxpiApAPqYvU7d6L8Res/e1/ZJ8CDZgY3QG1wicWPJHXFNZVrQ4oXpdjFvkNtCU4IFfFCMUCZMRUqwIq2gZrqYaC6LujxGqcBK3JnlwybzZfKe6O/sEut2seY5qv8OwajQuKDEsgp1B+5Qk3YKt9CjbL7yaqAkzM90CJKydrzM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0e34fc-76a2-407e-8989-08d81d788cb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 04:38:06.5046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bjyUwGRBhv2hyeLFnhp7KBoRVZes+OAc69JvVduHnV0L9kRgOUHl2nZMTjYiyFgIOvfl7Q7ID6id3GSPgD+kZ7CUsEV+fsz4zcT75OZOueo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7124
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0614cJAt006945
X-loop: dm-devel@redhat.com
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"paolo.valente@linaro.org" <paolo.valente@linaro.org>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"fangguoju@gmail.com" <fangguoju@gmail.com>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"ming.lei@redhat.com" <ming.lei@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mingo@redhat.com" <mingo@redhat.com>, "colyli@suse.de" <colyli@suse.de>,
	"jack@suse.czi" <jack@suse.czi>, "agk@redhat.com" <agk@redhat.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH 07/11] block: get rid of
	blk_trace_request_get_cgid()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/29/20 10:12 PM, Christoph Hellwig wrote:
> On Mon, Jun 29, 2020 at 04:43:10PM -0700, Chaitanya Kulkarni wrote:
>> Now that we have done cleanup we can safely get rid of the
>> blk_trace_request_get_cgid() and replace it with
>> blk_trace_bio_get_cgid().
> To me the helper actually looks useful compared to open coding the
> check in a bunch of callers.
> 

The helper adds an additional function call which can be avoided easily
since blk_trace_bio_get_cgid() is written nicely, that also maintains
the readability of the code.

Unless the cost of the function call doesn't matter and readability is
not lost can we please not use helper ?



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

