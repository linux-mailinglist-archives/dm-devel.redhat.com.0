Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 540722141F6
	for <lists+dm-devel@lfdr.de>; Sat,  4 Jul 2020 01:35:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-ppcfYN9HOvyJwM-5m-_-Zw-1; Fri, 03 Jul 2020 19:35:35 -0400
X-MC-Unique: ppcfYN9HOvyJwM-5m-_-Zw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79D8D107ACCD;
	Fri,  3 Jul 2020 23:35:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45084757DF;
	Fri,  3 Jul 2020 23:35:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40E3B1809547;
	Fri,  3 Jul 2020 23:35:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063NTfE7010620 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 19:29:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D965210BFD80; Fri,  3 Jul 2020 23:29:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D30BA10BFD6A
	for <dm-devel@redhat.com>; Fri,  3 Jul 2020 23:29:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2470F800296
	for <dm-devel@redhat.com>; Fri,  3 Jul 2020 23:29:36 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-482-MI3parngPVyZ2xC29Rnrcw-1; Fri, 03 Jul 2020 19:29:31 -0400
X-MC-Unique: MI3parngPVyZ2xC29Rnrcw-1
IronPort-SDR: yWDJBC0i2wNVh45QPpFNAQTd+YftwoiPkKY0jIMFRNJvMLwhYw7Qgj6CdySMP30QrnfkhNyYk1
	6I3RI9TU6pAgiORdKPwopEyo3NzeIi9QzOi7v1S0ShD7Kaxd/h++Nj4DexJVadvqyt/fkbyjeg
	tOLb1p+5Fw8SGiLiwuHQjY00sQBbSoAulNCUXSdB/bjsCmcSMnhnKz2jK8shkE8eHNW03UbAkV
	HDrmL4GqG9uQLzTvJRs0l4iMwtaRx1krghCSukrPiKcsB2xz5PzdO9o0Y1jTfujdjP1n+Kl7ih
	+2k=
X-IronPort-AV: E=Sophos;i="5.75,309,1589212800"; d="scan'208";a="141610806"
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
	by ob1.hgst.iphmx.com with ESMTP; 04 Jul 2020 07:29:28 +0800
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
	by BY5PR04MB6961.namprd04.prod.outlook.com (2603:10b6:a03:22b::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20;
	Fri, 3 Jul 2020 23:29:25 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6]) by BYAPR04MB4965.namprd04.prod.outlook.com
	([fe80::4d72:27c:c075:c5e6%7]) with mapi id 15.20.3153.027;
	Fri, 3 Jul 2020 23:29:25 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: "hch@lst.de" <hch@lst.de>
Thread-Topic: [PATCH 05/11] block: get rid of the trace rq insert wrapper
Thread-Index: AQHWTm8vk3fl1wwNBEOkFWbWf3m+uA==
Date: Fri, 3 Jul 2020 23:29:25 +0000
Message-ID: <BYAPR04MB4965DFE805071F971DC8C71C866A0@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-6-chaitanya.kulkarni@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ebbe502e-6e23-44fc-bd8b-08d81fa8ec6a
x-ms-traffictypediagnostic: BY5PR04MB6961:
x-microsoft-antispam-prvs: <BY5PR04MB69610F46129A7CBE896A2C25866A0@BY5PR04MB6961.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aHbK1d8ZEFddcJNCB4YXgzcAMrjzHQLfUlyudRbLpRUVapJC0ReE66OcA69kdCCZ4qj7jZmfekPHH+h5BQ+xHwI18ibzZjEzzQAhk68UK3FyjZb8iRA5a4hb4pujak5uuy1DPuM4BHA3mDkMDeyxzkq7jwdGCL021Ybc7b/j5TKbZNLlldIRXEVQMyVpJGt9Xl+IY9/nUB25v79VJc5zEJb91ETBZmDJoH+JoI02W7BUKeMBz+iGwiKq0eOuDtkP2A6onH1flWkUZxzce7CTKMkhEo38ErRIAz3GfbtJpWmtS6fVyAu2bt9klYhQQEMVP1HyM8nezE5B+VUpdlcfYTSB1SR96eLsKQbzIBddp6zXIyoWadJmlbzukGj4/puU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(55016002)(26005)(71200400001)(186003)(66946007)(7696005)(76116006)(478600001)(54906003)(52536014)(5660300002)(316002)(7416002)(9686003)(2906002)(86362001)(8936002)(8676002)(4326008)(66476007)(66556008)(66446008)(64756008)(6916009)(83380400001)(33656002)(6506007)(53546011)(26583001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: GRpAjlEJSwXkVjDM84apE2wekkuAJ08L7k/ec3+IylKR/TDc28J16ZKqkLRu8g7VE6SwPbl8IQyPHvhtB6K3jntYJK+zWMbOfxDVDUmpzQfHNLk60FYg10RhhPdSWw2ROLJe2vuGFXOedRZBLoiGbuQf5Veif8mAEE3aKFxo1yhlTAiQswThR8eg7sxItcsnwVKQS032Rqjn981xO7UC+CZBdGOPJqNnqjmWCuDzkKue3XGaW0jVFRe6X5DoZEihOunhFDEHY/AEbOmiXH79zWWy/8S+ExtKuoHZ9E7BsFqLVM0aFaLJ2QUC3TK30EXB2ohvv4qPi3xIt5B7Tx4i91psi3HUlqKHMwecNMuGKoQTkkDeou4g72VIdWj4eXYYA8ujyKeu6zrHfv57spLpCNbne+kFfE+mfcBTZSy7lwkivj3aN79wTAi+j9+fSuvKX1I7Bumm0ebiMVAfPn9yREARw/TAQIr7KfNRnY2Chmo=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbe502e-6e23-44fc-bd8b-08d81fa8ec6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 23:29:25.2841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVmDLlrXTKpFqjWvC0CpvOvuffAmq2aNlUM9S6bdtbCPxOGQkUDPDNRRGUm78Bvis3/V8zVYetr+Rh8swMrJ8bfwKO1hvYZakaYiCmYpU80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6961
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 063NTfE7010620
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Christoph,

On 6/29/20 4:44 PM, Chaitanya Kulkarni wrote:
> Get rid of the wrapper for trace_block_rq_insert() and call the function
> directly.
> 
> Signed-off-by: Chaitanya Kulkarni<chaitanya.kulkarni@wdc.com>
> ---

Can we re-consider adding this patch ? here are couple of reasons:-

1. Increase in the size of the text region of the object file:-

    By adding the trace header #include <trace/events/block.h>
    in io-scheduler where it is calling trace_block_rq_insert()
    increases the size of the text region of the object file
    kyber(+215) & bfq (+317) [1].

2. Mandatory io-sched built-in kernel compilation:-

    When testing with a different io-sched KConfig options ("*" vs "M"),
    when kyber and bfq compilation option set to "M" having this patch
    reports error[2].

If I've not missed something here then can we drop this patch ?

In case we really want to do this change it will need to have KConfig
separate patch such that if tracing is selected it will force * 
selection (built-in KConfig) for schedulers in question and etc.

Do we want to do this ?

Regards,
Chaitanya


[1] Scheduler IO object size comparison :-

    Without this patch :-
    ---------------------
    # size block/bfq-iosched.o
     text	   data	    bss	    dec	    hex	filename
    62204	   1011	     32	  63247	   f70f	block/bfq-iosched.o
    # size block/kyber-iosched.o
     text	   data	    bss	    dec	    hex	filename
    14808	   2699	     48	  17555	   4493	block/kyber-iosched.o
    With this patch :-
    ------------------
    # size block/bfq-iosched.o
     text	   data	    bss	    dec	    hex	filename
    62521	   1028	     32	  63581	   f85d	block/bfq-iosched.o
    # size block/kyber-iosched.o
     text	   data	    bss	    dec	    hex	filename
    15023	   2716	     48	  17787	   457b	block/kyber-iosched.o

[2] Error with selecting M for io-sched kyber & bfq :-

ERROR: modpost: "__tracepoint_block_rq_insert" [block/bfq.ko] undefined!
ERROR: modpost: "__tracepoint_block_rq_insert" [block/kyber-iosched.ko] 
undefined!
make[2]: *** [Module.symvers] Error 1
make[2]: *** Deleting file `Module.symvers'
make[1]: *** [modules] Error 2
make[1]: *** Waiting for unfinished jobs....
arch/x86/tools/insn_decoder_test: success: Decoded and checked 4932572 
instructions
   TEST    posttest
   arch/x86/tools/insn_sanity: Success: decoded and checked 1000000 
random instructions with 0 errors (seed:0x4c6e1a40)
	CC      arch/x86/boot/version.o
	VOFFSET arch/x86/boot/compressed/../voffset.h
	OBJCOPY arch/x86/boot/compressed/vmlinux.bin
	RELOCS  arch/x86/boot/compressed/vmlinux.relocs
	CC      arch/x86/boot/compressed/kaslr.o
	CC      arch/x86/boot/compressed/misc.o
	GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
	MKPIGGY arch/x86/boot/compressed/piggy.S
	AS      arch/x86/boot/compressed/piggy.o
	LD      arch/x86/boot/compressed/vmlinux
	ZOFFSET arch/x86/boot/zoffset.h
	OBJCOPY arch/x86/boot/vmlinux.bin
	AS      arch/x86/boot/header.o
	LD      arch/x86/boot/setup.elf
	OBJCOPY arch/x86/boot/setup.bin
	BUILD   arch/x86/boot/bzImage
	Setup is 15132 bytes (padded to 15360 bytes).
	System is 8951 kB
	CRC ff6eac72
Kernel: arch/x86/boot/bzImage is ready  (#59)
	make: *** [__sub-make] Error 2



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

