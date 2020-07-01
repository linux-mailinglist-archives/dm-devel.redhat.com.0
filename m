Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DD154210304
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 06:34:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-QQWN0ObGOCODnj5UwbnR6Q-1; Wed, 01 Jul 2020 00:34:29 -0400
X-MC-Unique: QQWN0ObGOCODnj5UwbnR6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C2CA8014D7;
	Wed,  1 Jul 2020 04:34:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D60E92B4A9;
	Wed,  1 Jul 2020 04:34:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 187726C9C3;
	Wed,  1 Jul 2020 04:34:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0614YH3K006536 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 00:34:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DAAFB2166BA2; Wed,  1 Jul 2020 04:34:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4BEE217B439
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:34:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBBFA858EE2
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:34:15 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-319-QO7UJcg4MMCQ4dl_-NakiA-1; Wed, 01 Jul 2020 00:34:12 -0400
X-MC-Unique: QO7UJcg4MMCQ4dl_-NakiA-1
IronPort-SDR: NRlKOgBe/aX+ek/fcrxmg290STTtuXZYuA9WbFjz2j6AYjZlarr7EA3hfxJt5yQg+zwLmC2+0c
	fYqWML3kfW6Kqbep8Oic8nEiPF3XJS9vdvYddR0l9zB2WeFmxzqSi+k7bBIfn47WtMOOHy2unb
	YpgcTmFHhW3tk1H6qqmLogYNJYKB6P6Fo1Codg6J6KalUn/8Eq56Xb7bmVb5e/Fj8Hxyr4GT8j
	CBvTKdvFNPQInQiLpFPjYTxSu2bOXCGw9clErodrcrBIj2GqDUTadglG+O+VIZf0mVyDUs1Qjw
	LnI=
X-IronPort-AV: E=Sophos;i="5.75,298,1589212800"; d="scan'208";a="141545612"
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
	by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2020 12:34:09 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
	by BY5PR04MB7124.namprd04.prod.outlook.com (2603:10b6:a03:22f::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26;
	Wed, 1 Jul 2020 04:34:08 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6]) by BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6%7]) with mapi id 15.20.3131.027;
	Wed, 1 Jul 2020 04:34:08 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 05/11] block: get rid of the trace rq insert wrapper
Thread-Index: AQHWTm8vk3fl1wwNBEOkFWbWf3m+uA==
Date: Wed, 1 Jul 2020 04:34:07 +0000
Message-ID: <BYAPR04MB496592F9BE389ED9E39DFE21866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-6-chaitanya.kulkarni@wdc.com>
	<20200630051116.GC27033@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ee1f84ee-aed9-4928-237e-08d81d77fe81
x-ms-traffictypediagnostic: BY5PR04MB7124:
x-microsoft-antispam-prvs: <BY5PR04MB7124DA95A47ED805B9C961BB866C0@BY5PR04MB7124.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:159;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OV/RcrHZgdUOavQcD+Na/zWNq09z+8ryPDQTGbnIRScSHlkztz8jnApoyFBcpj6WWL9Rndx3ypaPa0eRn423M0fEYq1IiAFreobllVsFJ8UlpdJrAzceFHFau8SCQQQpRk6XFkMj4jaqwoWk4SEdxowr2JQI+QYgNUtwBD0mg/8xqDciL0Y1mOhelxB60lw3sm2tiscXm+oKSCLO6PnckTe5nsw2JMwK6qjyt8y6Gw4Bu1h3J5XV62cLqDpBnF0NJOtDYfgmvty36LErgYx+kksTl+LhteGT5e25i4v2cghroGffzPQS9TXXQ/+LZBdQIkZiBoB0FmLUw4607F70AoxVqUe0PkeAaZgDKJuhtMYpjX9yikCIGTALLbggGb8B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(6506007)(8676002)(316002)(53546011)(186003)(4326008)(26005)(6916009)(71200400001)(54906003)(52536014)(33656002)(4744005)(83380400001)(5660300002)(8936002)(76116006)(86362001)(64756008)(66446008)(66556008)(478600001)(66476007)(7416002)(55016002)(7696005)(66946007)(9686003)(2906002)(26583001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: tb1pFtzoR4a3Y20JbuDZxs46Rno3lrVGBb6Taj4E4LLITdoroDrvdQRzQDVhAbT0zIrs1cU7TSdwB4uGdJZ1WfIr7QyIm7sWkv9EaeVo/yZhRev5TarJlVoBwRYLIK5T6AEsgqnKqTTibdYZdBQi0bd2Ri6wjVQjh9o3qlKcRGsmu6FEcg+PxoN5ZrnvjKfI3UzU+ajiF4kSHHzk6qgZKT0yVhlqydFGXhZCzwyQsckeplHiGDYh1DVIWlSujbnAMeUAKEwVGQI2uozo3Ug8bOSASGBICHLSFAXqdUaFfS3RSJ68Rhn3BOZbv8QwhV31VpwcgWyxb7dqmVDXyTMpYJwSadCYmuu6LeLIZMtuzzzoHBZ/o0nzqFic+DP5ADi9Lbr1X0iQW8VZbNsGHeA84l+wEDAbZAimByN/b1S2Q14MbS+flcWN5WHBf+0+SQ4/JxMXdB8/Wuoq74D55tbP3OIIhQr76Tmym1aMrntGYPs=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1f84ee-aed9-4928-237e-08d81d77fe81
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 04:34:07.9615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P4Rwjo7ZlNR4sRJTg7NKNMlUsgJkh9tfjXOVZ5RHJKSlEpuaS59KPJCjXi1i/cOvACaA26x1wnP5eWz9dyhHs6y3JkPW0rndK9OmtPaECw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7124
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0614YH3K006536
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
Subject: Re: [dm-devel] [PATCH 05/11] block: get rid of the trace rq insert
	wrapper
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/29/20 10:11 PM, Christoph Hellwig wrote:
> On Mon, Jun 29, 2020 at 04:43:08PM -0700, Chaitanya Kulkarni wrote:
>> Get rid of the wrapper for trace_block_rq_insert() and call the function
>> directly.
> I'd mention blk_mq_sched_request_inserted instead of the tracepoint
> in the subject and commit message.  Otherwise this looks fine.
> 
Okay, will change the message.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

