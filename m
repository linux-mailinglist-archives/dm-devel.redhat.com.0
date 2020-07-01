Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 42BF22102FB
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 06:32:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-XnvDiLMDPAyR1IP1eODEOw-1; Wed, 01 Jul 2020 00:32:50 -0400
X-MC-Unique: XnvDiLMDPAyR1IP1eODEOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59C2180058A;
	Wed,  1 Jul 2020 04:32:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C003B5DD63;
	Wed,  1 Jul 2020 04:32:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9358E6C9C4;
	Wed,  1 Jul 2020 04:32:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0614WRU9006346 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 00:32:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9ECEEFC724; Wed,  1 Jul 2020 04:32:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AE75FA207
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:32:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F27358EF3AA
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:32:23 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-213-VenuxzA_OdKsq1gAMEt2NA-1; Wed, 01 Jul 2020 00:32:19 -0400
X-MC-Unique: VenuxzA_OdKsq1gAMEt2NA-1
IronPort-SDR: zXOV38qYZMOD6YznMj/3049KGfrlf8+RSEx4DBDm0T+S1RvjK8xKp5bceSwwf1cOAYPmfoy3KE
	Bpe92rQ+VZq/W0JcIyb/RrCf+Dalm2lSQETwCvjDL0hBoDAFDxsBuAmbjHNkZ9FAeNvGHoSyQl
	J/NRqf7sDG9tSb0BcrrFpNc5klptEaYJnp/LdAX202D4LP+VlgDKYVRacHf8pa696I4dvjD4XQ
	qofL+nGFfuwqKTjmITwkGdxrcL3K9F+xz24D+FqolvWTEy2VT7OhNJ3rSmqOjFGUmhCadCsMNW
	5AE=
X-IronPort-AV: E=Sophos;i="5.75,298,1589212800"; d="scan'208";a="141341098"
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
	by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2020 12:32:12 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
	by BY5PR04MB7124.namprd04.prod.outlook.com (2603:10b6:a03:22f::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26;
	Wed, 1 Jul 2020 04:32:11 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6]) by BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6%7]) with mapi id 15.20.3131.027;
	Wed, 1 Jul 2020 04:32:11 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 01/11] block: blktrace framework cleanup
Thread-Index: AQHWTm8WcXOM6eH0gUCsI/M36HXU0g==
Date: Wed, 1 Jul 2020 04:32:11 +0000
Message-ID: <BYAPR04MB496556D53F75E6E2751799BE866C0@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-2-chaitanya.kulkarni@wdc.com>
	<20200630051001.GA27033@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2ee17b7f-36c7-4208-724c-08d81d77b918
x-ms-traffictypediagnostic: BY5PR04MB7124:
x-microsoft-antispam-prvs: <BY5PR04MB7124BE914CB3F5BF56C546DD866C0@BY5PR04MB7124.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BT/480n7XyHrddx6suidMX6MKzKRg1hCP0eggFBy1tcE2sthXEIgAT6pjcxY4EF4ztmfrAaZaLa1yFjua1QyXjYhS8JM1TfmxeFXmycrRDMkLt86TWZWWPsa8p8ptUKqRMPkESrjt7mRvdF3LjdnEMFBCfqHNoheqnS8ZYZJToB63fo+TBBnAObgpTrxkh7Y7twVLcm+TwUHuIQAysBfPetRYJ1PBntcLgDZcFZskwB2oOBfDTK8Cdk9rfldCYPBiPguZKN0dvhu1iJ6KdrrDir1tIfviE+lwEeZNUBA3XNLfeSB+c0fOskKKTXVZjoAAXsoWE63W/Z1e32BdXKwBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(6506007)(8676002)(316002)(53546011)(186003)(4326008)(26005)(6916009)(71200400001)(54906003)(52536014)(33656002)(83380400001)(5660300002)(8936002)(76116006)(86362001)(64756008)(66446008)(66556008)(478600001)(66476007)(7416002)(55016002)(7696005)(66946007)(9686003)(2906002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 0NALILbIOsP3E9Srr3dqfLDrMN0cAgXI54PMV2Uewn69eWxv4HRQbZaIRG/IXKBwe7CBYmvrlyivFyLn3njKkjrNGOKvfl+B19E5arekUGhM0G76uMP/KP7TiKzy1iRmNYz5PZYsuVEfeHYAbl9oXGoyjsFqBCDdsoNNCIW/tvmUbhYwHF8hjXmsqDHdc0kdHTk1IdISNRGFNa1yCqy8kad6PPeDfy1+5uTC5bhcwVMgsJ3x211kYS2HwufGWCOld7utgJrzjIvjuI1R01ALn0FXUYaLHXJtfF0EiNjrHwNlCxlMOxsmwF7ElSbKdbke4FxUfPcE/IL2I39M+XxFymgx2FAbWzCViW1pEipcWHCfWH9PN82Jo5cRyh7GjyYSK9qaJAt1NXonmnyAcGOYiP/iV9HFlIRSQfxK/rUSuqbWyPqPTplNqmqLzMBe8LYeB5a4VgNNbPTw8PFDCuY0IfF7dX49JNe5vXCYv0/18GM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee17b7f-36c7-4208-724c-08d81d77b918
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 04:32:11.4936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jhk9F+nyN+dlZWvLopVn9/klJAAhf2XP2q/hvK4wGzDfcKEujI5RfovsnA8JT20FSKKQ6wXV6spM7jShRFMKugqrO76UjY+kkJfUFY7jNjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7124
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0614WRU9006346
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
Subject: Re: [dm-devel] [PATCH 01/11] block: blktrace framework cleanup
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

On 6/29/20 10:10 PM, Christoph Hellwig wrote:
> On Mon, Jun 29, 2020 at 04:43:04PM -0700, Chaitanya Kulkarni wrote:
>> This patch removes the extra variables from the trace events and
>> overall kernel blktrace framework. The removed members can easily be
>> extracted from the remaining argument which reduces the code
>> significantly and allows us to optimize the several tracepoints like
>> the next patch in the series.
> The subject sounds a litle strange, I'd rather say:
> 
> "block: remove superflous arguments from tracepoints"
> 
> The actual changes look good to me.
Okay, will change that.
> 
>> +		trace_block_rq_insert(rq);
>>   	}
>>   
>>   	spin_lock(&ctx->lock);
>> @@ -2111,7 +2111,7 @@ blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
>>   		goto queue_exit;
>>   	}
>>   
>> -	trace_block_getrq(q, bio, bio->bi_opf);
>> +	trace_block_getrq(bio, bio->bi_opf);
> But now that you remove more than the q argument in some spots you
> might remove the op one here as well.  Or limit the first patch to
> just the queue argument..
> 
> 

Yeah thats is where I had difficulty, and when I tried to do it in one
patch it got complicated to review. I'll keep the first patch for the
q only and patch(s) for rest arguments as needed it easy to review that
way.




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

