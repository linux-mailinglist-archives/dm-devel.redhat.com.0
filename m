Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9B39E206B73
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 06:55:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592974547;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=eRrL0vzr4vbL5c3DKALy7KNfC7I9x2JxfYjjA0J0zAU=;
	b=B8vgEmIGjR5wWonFn5TQBzmdmJprOhYi+MyZ2U+leianruqq29yeDnalFIx1yn39X0+iZv
	APC/KcWgbaLg0B0qv21c+wX4BjkYGjrLN8Avny7WYXnxTQk4DS1B7cS7mqEKPQqDzlByAw
	hAGBDVVyO8OQGzGzpABa/cn22eTk+2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-UFm3f_94MAKfSi7Wzjux4g-1; Wed, 24 Jun 2020 00:55:44 -0400
X-MC-Unique: UFm3f_94MAKfSi7Wzjux4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A43EB800597;
	Wed, 24 Jun 2020 04:55:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E70F55BAEF;
	Wed, 24 Jun 2020 04:55:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43C821809542;
	Wed, 24 Jun 2020 04:55:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O4sVik016316 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 00:54:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 352B9217B437; Wed, 24 Jun 2020 04:54:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30136215671E
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 04:54:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 097BE8007B1
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 04:54:29 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-241-JRK5CVNBN9edsvhxApIqEg-1; Wed, 24 Jun 2020 00:54:22 -0400
X-MC-Unique: JRK5CVNBN9edsvhxApIqEg-1
IronPort-SDR: Cs3V/c83DcHf1Fn3pM/TZadWO7DCMjcCPwbmgj3DOExjrbXoCS0oFKi4N+jGEFVFRupyM10ZbI
	CG3jmyNw9eCBRPggNpjFeZL3ktSmfKUp6TA0bwZppyqqEp0ZUPd4qa0MFsA95MRBa0ep1S1WGf
	51fCzlqHYRMigISyZu4I0HdScS9Z+Sj8RYVibgYEzDf5VobEZuzC+KLnwi5nRSBWsJejNxyDev
	6mfjxGUq4JsAViKILBaghgaUEGOlmcycjYyGUMUiASrmIf9Dh9+9ycv4EHU/Kuy2jnRXwoEpek
	9OM=
X-IronPort-AV: E=Sophos;i="5.75,274,1589212800"; d="scan'208";a="142139292"
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
	by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2020 12:54:21 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0567.namprd04.prod.outlook.com (2603:10b6:903:b1::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22;
	Wed, 24 Jun 2020 04:54:18 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3109.023;
	Wed, 24 Jun 2020 04:54:18 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>
Thread-Topic: [dm-devel] [RFC PATCH 0/1] dm-crypt excessive overhead
Thread-Index: AQHWSW85EuQz0D2EUU26/bqk/44H8Q==
Date: Wed, 24 Jun 2020 04:54:18 +0000
Message-ID: <CY4PR04MB3751EB316BFD5600AFAA6796E7950@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<CY4PR04MB3751F148CCFAAC99A7F05CF7E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200623150118.GA19657@redhat.com>
	<CALrw=nHNJTX3kzv2Q=dc6hYr=d8S2=gT0VHkWigS1pmwr9ps5Q@mail.gmail.com>
	<20200623152235.GB19657@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ac1a6248-dfb1-49a3-4b6e-08d817faa6e2
x-ms-traffictypediagnostic: CY4PR04MB0567:
x-microsoft-antispam-prvs: <CY4PR04MB05679BD8ED988C7AA9C3F057E7950@CY4PR04MB0567.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E//ejX1w/t9q0bzADKxW4N//OQ5wCWiNtyb3xStBtT7tdaW355T/QXI0WVULiioPCX5heLUJibz3jX6PlgB65iOjbieCVB06kLpWSVvP4JRXE2c7HoSnEiU+nk0aS86+zldpmw33X/cpJzl/CEgh+pIylrXmJ2HH/p85CpTyA/P11JQioF+n/OD0LZ/Fexg9Yd6keA2ldncv+I+EBM7gxuvmj7zaNq0+141awSWPcpQOpnjl7ijKVmbFz3492AQQ3SJGzx5kUxTcqW3N3bB0XMCzTQwcOPVP8r9NUXy2jTvstb2frUBbeDGdn4BEQ2S5Oml9IMexFcPq5cbs7nVEP6ESlSnIXSShjZe7SyNDRLR5MB8SxrYyiFmIJA81PIdJ+/P/FeA3pb2buzgOe3ch1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(186003)(966005)(478600001)(7696005)(6506007)(26005)(53546011)(8676002)(2906002)(316002)(55016002)(8936002)(52536014)(33656002)(9686003)(54906003)(110136005)(4326008)(64756008)(91956017)(66446008)(66556008)(66946007)(66476007)(76116006)(71200400001)(83380400001)(86362001)(5660300002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: CDa01nptxlDgMy0AwLizDn87dpMlMIWUAmjM0vzkNJnAAmKKBsGkkNiTWXkNVYPo61wlQOj/VL8pXXtCv2ShREXJc9IeILAJf30mxZKbtwX4y/dxMyDiiX++ggng38jWqgus7/4VPJo7KZR3Gu2zOsYB4+/3nHZnYyuoQfAKSVFf43ziHW9eJMvYC+EB+SmqiDzeloQKnB+vV8PjKp+RzzfBvegiJn0HX67dYSBvxCvYa5seeOFmzBc1Q/r4Hp+GCD9FkJ1YB9mSgxBiQiIcwNmUlQqp2S/ggQBbeh5YWK5OGYymdL5TY4F7ZC2dKm97KzN2N6NmjvmrAbRcky+rUZclEVnNtKJoWD5hTPlVFaVRL+KxUNI0gyqcbqP7VLh0UJYLEucKAODwTQjgReOMlpn2RBR0qlb6OyKvzyiqJdDMdL79/zlLNV9pH69Mf6DUDFG1c5Md5Jd/KsYpV47p1gSJM/46CPeAlKunq13NnfDDwntqhwZKy5YArwpBDKSP
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1a6248-dfb1-49a3-4b6e-08d817faa6e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 04:54:18.0407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xH3hC9IFXu4ej9Jg16EhTk81LceXwZ6zZ4HV8fhqDKWFmVxsxQpFNKNtiDlfVqkm/pcO+4YeYHzZUBN3UvHjUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0567
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05O4sVik016316
X-loop: dm-devel@redhat.com
Cc: "kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
	"dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 0/1] dm-crypt excessive overhead
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

On 2020/06/24 0:23, Mike Snitzer wrote:
> On Tue, Jun 23 2020 at 11:07am -0400,
> Ignat Korchagin <ignat@cloudflare.com> wrote:
> 
>> Do you think it may be better to break it in two flags: one for read
>> path and one for write? So, depending on the needs and workflow these
>> could be enabled independently?
> 
> If there is a need to split, then sure.  But I think Damien had a hard
> requirement that writes had to be inlined but that reads didn't _need_
> to be for his dm-zoned usecase.  Damien may not yet have assessed the
> performance implications, of not have reads inlined, as much as you
> have.

We did do performance testing :)
The results are mixed and performance differences between inline vs workqueues
depend on the workload (IO size, IO queue depth and number of drives being used
mostly). In many cases, inlining everything does really improve performance as
Ignat reported.

In our testing, we used hard drives and so focused mostly on throughput rather
than command latency. The added workqueue context switch overhead and crypto
work latency compared to typical HDD IO times is small, and significant only if
the backend storage as short IO times.

In the case of HDDs, especially for large IO sizes, inlining crypto work does
not shine as it prevents an efficient use of CPU resources. This is especially
true with reads on a large system with many drives connected to a single HBA:
the softirq context decryption work does not lend itself well to using other
CPUs that did not receive the HBA IRQ signaling command completions. The test
results clearly show much higher throughputs using dm-crypt as is.

On the other hand, inlining crypto work significantly improves workloads of
small random IOs, even for a large number of disks: removing the overhead of
context switches allows faster completions, allowing sending more requests to
the drives more quickly, keeping them busy.

For SMR, the inlining of write requests is *mandatory* to preserve the issuer
write sequence, but encryption work being done in the issuer context (writes to
SMR drives can only be O_DIRECT writes), efficient CPU resource usage can be
achieved by simply using multiple writer thread/processes, working on different
zones of different disks. This is a very reasonable model for SMR as writes into
a single zone have to be done under mutual exclusion to ensure sequentiality.

For reads, SMR drives are essentially exactly the same as regular disks, so
as-is or inline are both OK. Based on our performance results, allowing the user
to have the choice of inlining or not reads based on the target workload would
be great.

Of note is that zone append writes (emulated in SCSI, native with NVMe) are not
subject to the sequential write constraint, so they can also be executed either
inline or asynchronously.

> So let's see how Damien's work goes and if he trully doesn't need/want
> reads to be inlined then 2 flags can be created.

For SMR, I do not need inline reads, but I do want the user to have the
possibility of using this setup as that can provide better performance for some
workloads. I think that splitting the inline flag in 2 is exactly what we want:

1) For SMR, the write-inline flag can be automatically turned on when the target
device is created if the backend device used is a host-managed zoned drive (scsi
or NVMe ZNS). For reads, it would be the user choice, based on the target workload.
2) For regular block devices, write-inline only, read-inline only or both would
be the user choice, to optimize for their target workload.

With the split into 2 flags, my SMR support patch becomes very simple.

> 
> Mike
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

