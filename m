Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA482114B8
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 23:07:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-uypH-RNNM7C5dCYnWIei5A-1; Wed, 01 Jul 2020 17:07:07 -0400
X-MC-Unique: uypH-RNNM7C5dCYnWIei5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2206800D5C;
	Wed,  1 Jul 2020 21:07:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F7AF17D8F;
	Wed,  1 Jul 2020 21:07:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74C7C1809561;
	Wed,  1 Jul 2020 21:06:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061L6s4I000774 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 17:06:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9357711796E6; Wed,  1 Jul 2020 21:06:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D67011796E5
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 21:06:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A10A2800883
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 21:06:51 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-464-e_aB2bOmNZ6iQ0x8R66OWg-1; Wed, 01 Jul 2020 17:06:47 -0400
X-MC-Unique: e_aB2bOmNZ6iQ0x8R66OWg-1
IronPort-SDR: +A3CFPWwqZLCVhO46iPJFOvoIzwvgZygatKYHAui0oZkm73CbeIG5sjod00TnsCYKeKt9eNNgB
	2X8S22P6jQ+tPD78sK+EGM9sglBF6ImK3mC+lD1XypZByJuBveJROWys00yFJbFIxpBsNvyk1v
	OFa5PIAksESd5EIubAdSkfDWVVz1w7hGUMIdLMhydPxrcURU7ApYdw0L9QtdWEn+cAYQ8ngcHE
	h6GZX/qEfdIxpr0HBSTBNIMLtfhI7c6DgzL40sXHftlUd/eDhy0TDGpMRn7FFDDXw1mQQi72/w
	78w=
X-IronPort-AV: E=Sophos;i="5.75,301,1589212800"; d="scan'208";a="250654139"
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
	by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2020 05:06:44 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
	by BYAPR04MB4328.namprd04.prod.outlook.com (2603:10b6:a02:ef::33)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Wed, 1 Jul 2020 21:06:43 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6]) by BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6%7]) with mapi id 15.20.3131.027;
	Wed, 1 Jul 2020 21:06:43 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 10/11] block: use block_bio class for getrq and sleeprq
Thread-Index: AQHWTm9LvGU76q0unUybnpt+xj1KpQ==
Date: Wed, 1 Jul 2020 21:06:43 +0000
Message-ID: <BYAPR04MB496556D7288B9EE3180DA3B6866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-11-chaitanya.kulkarni@wdc.com>
	<20200630051332.GG27033@lst.de>
	<BYAPR04MB4965E849D99120B59011CEF5866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
	<20200701061858.GB28483@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c8fad9ad-83fe-40b0-ae5b-08d81e02a81f
x-ms-traffictypediagnostic: BYAPR04MB4328:
x-microsoft-antispam-prvs: <BYAPR04MB4328C1320D08F1C6DF929A5A866C0@BYAPR04MB4328.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ErcZyZrDPnhlFnTmPVyzY2OXF4vo2Ux0Fjf+l6cShIlT+m3s6y/1Yr3PocHaoe/1sHZoJfvJ38fK3U7/5AOZuqe/myBHxI1yj/vuhaRJr4Ln9zI69M5xQwXrE1y+JEEmK07UiTU39zYiH9xOt4UUbv9yJmM8WhDQwfSrv8rdTI8DyEZmvqGd5O+9JrVxSvCapuy3keJoJ44bjzCzkYSdAyq8T0XYGZCOxLMrUX+WW6HJSK3edwGldVZB7B7e533dT6ZPl3m0CKy9CpncXg0GLbrj1dLDm8kP2kdWK5YDtpTqKpiK+3MLEa50f7salXzHeXO0yYilMaoLwxbH9KhCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(52536014)(26005)(55016002)(6916009)(7416002)(54906003)(8936002)(33656002)(7696005)(71200400001)(83380400001)(66556008)(8676002)(64756008)(66476007)(66446008)(498600001)(9686003)(2906002)(86362001)(76116006)(53546011)(5660300002)(66946007)(6506007)(4326008)(186003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: M6nHMoyVZeO4ymwF7x8YkzL/W19wKWdXoMwqcEo7W73csQmRttE+kYjzOAXh8LJuJMORWyQ2x6IrNMMQoUH/O1whdfFKaMyXYD62k33ozGzvOj0mUn/p1KUUPDdevddYipkFrqAVNuWsuHHv27zqEt8lvYzWtylBdRcZ2o04uCFDBk6IbKfcnu0iUOM/Ni/l57hpJuIPWuiwyHy8Puq/MPI7CGx0HsGovu61oykCB7LFnmDQimvB4ybGYKJIpWql58rbke3/DL0fSz5pikR9TXr8nr+HuFje6IPnZFQF6lkbZSMHKgkh1mWmx+MZ6gTT1UgmZMYKALhmCRrLbNIAgOAxU4INzqWXxAnmZZyiObs4G0dLuRr0q+OnSat7YXQAsXEMROnvvDyC80nkQXPK2HJT5K0HCPvhojlbA0muPeEk09Wawv5tYDeigkv9cornYATtG9fbbUSDl9+LMRN/8V+DfuKIsCSHl1DhQGE/Ac6ICWbmwD8/ZBhl+pLLj8pn
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fad9ad-83fe-40b0-ae5b-08d81e02a81f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 21:06:43.0282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k4VjNlqiME1/ydCzQxnxuCuh0GpplpyUzQ5ZoEeXrii2ef0Nel/sjHNHIX/woYOfT0gz7VekZo04vdscU+IboGTUV3PYTimSRed6RZnhxO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4328
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 061L6s4I000774
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
Subject: Re: [dm-devel] [PATCH 10/11] block: use block_bio class for getrq
	and sleeprq
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/30/20 11:19 PM, Christoph Hellwig wrote:
> On Wed, Jul 01, 2020 at 04:45:03AM +0000, Chaitanya Kulkarni wrote:
>> On 6/29/20 10:13 PM, Christoph Hellwig wrote:
>>> On Mon, Jun 29, 2020 at 04:43:13PM -0700, Chaitanya Kulkarni wrote:
>>>> The only difference in block_get_rq and block_bio was the last param
>>>> passed  __entry->nr_sector & bio->bi_iter.bi_size respectively. Since
>>>> that is not the case anymore replace block_get_rq class with block_bio
>>>> for block_getrq and block_sleeprq events, also adjust the code to handle
>>>> null bio case in block_bio.
>>> To me it seems like keeping the NULL bio case separate actually is a
>>> little simpler..
>>>
>>>
>> Keeping it separate will have an extra event class and related
>> event(s) for only handling null bio case.
>>
>> Also the block_get_rq class uses 4 comparisons with ?:.
>> This patch reduces it to only one comparison in fast path.
>>
>> With above explanation does it make sense to get rid of the
>> blk_get_rq ?
> Without this we don't need the request_queue argument to the bio
> class, as we can derive it from the bio, and don't have any
> conditionals at all.  I'd rather keep the special case with a
> queue and an optional bio separate.
> 

Okay.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

