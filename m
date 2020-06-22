Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 01184202DF4
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jun 2020 02:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592786755;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=cvjL9RrGdQA5OJGCNGuf85BC7Pgsh3NF8bBE40yLptw=;
	b=cJMTy8ALQySbtLJ7JP//Zm3r57nD4L1dG0RiEIJIQ4319sGIbr2W0lP1aN7VM4D78Js+PL
	npqSMYUHfJHvvT1BZv8aCA3aLVrf9AEKF+9e3+F3vuk7YA9mgMhbEwRs7DFzBx/4c6ezI6
	LWIjKy253B2ONZ+hvNCBTRjCOFmb5zU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-87vNyn8YN3-Of1_0y5pqjg-1; Sun, 21 Jun 2020 20:45:53 -0400
X-MC-Unique: 87vNyn8YN3-Of1_0y5pqjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32BE7835B42;
	Mon, 22 Jun 2020 00:45:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D1D85BAD7;
	Mon, 22 Jun 2020 00:45:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E37D3833A3;
	Mon, 22 Jun 2020 00:45:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05M0jSVq021420 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 21 Jun 2020 20:45:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A3D8F2026D67; Mon, 22 Jun 2020 00:45:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E7A72026DFD
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 00:45:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EE7E101A525
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 00:45:26 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-322-RWaojGDWO8ajjaU0MtW8eQ-1; Sun, 21 Jun 2020 20:45:24 -0400
X-MC-Unique: RWaojGDWO8ajjaU0MtW8eQ-1
IronPort-SDR: bCgRgX+QSTQ+62T4/nysA6ugivx51aE3ugRBQXyH2bt8BZneYoZA6oPupuu84OIFI2UolaAwjd
	ytZwP1usk5kbW3+n4M6b/2X6+WTKBFDJihmNOKX0GD7g33wtH/p4KOiDSY8geAdPAl2y6kBk5j
	18j3QN0XwvaemCsU/DRGCwLQAJ6RJ4jXPmb2NPgmw3mzxUsL1I0OtgeQiIMh5xZGphLnM2CsAC
	KFsRENSOyJi5AhGxV5KbfTGtw8Hp1Jf0n8iogofYG+e+blckTAmR7O8oER6e4FbwO/RFAkOCTO
	r5k=
X-IronPort-AV: E=Sophos;i="5.75,265,1589212800"; d="scan'208";a="144884352"
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2020 08:45:22 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0247.namprd04.prod.outlook.com (2603:10b6:903:3c::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22;
	Mon, 22 Jun 2020 00:45:20 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3109.023;
	Mon, 22 Jun 2020 00:45:20 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>, 
	Mikulas Patocka <mpatocka@redhat.com>
Thread-Topic: [dm-devel] [RFC PATCH 0/1] dm-crypt excessive overhead
Thread-Index: AQHWRlqI8D6+Lz65i0Kgr2YROVo4Vg==
Date: Mon, 22 Jun 2020 00:45:19 +0000
Message-ID: <CY4PR04MB3751F148CCFAAC99A7F05CF7E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 94d66db1-d208-498a-01a5-08d816458a33
x-ms-traffictypediagnostic: CY4PR04MB0247:
x-microsoft-antispam-prvs: <CY4PR04MB02472A510210A0B562E5290BE7970@CY4PR04MB0247.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0442E569BC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BsUQoB8bYs1kBoEyIMHmZ3KO3lkeeyAVxN2PIKnBP5FPHjBptDpXU9XgLBlFlhYeIOsnMY8q4EJF+kSW1hIQxffsL+ALnHmfYlphDy7qLRpNmUMRrHfy2Dd+UdPFWJfDxvsx1J+1LxOCwxP14MxItn7NTQxGyZEePq9MaeIHoopM3hQZ5Muib3mxGkrhfhm2fD8MU/88sNCcExJFhSafQnbPNkyJbK101ZZ2O74sa89xbb/DpD21h/fYQFGN/NhkiQaK6Hw88N/F9GApe+oxOZJ46V9euyKj3lI8mdm29lHHMm7hAl/zA8H6NWTtYgFtFnGOGvMbhEoDr1SfHahumSVs+4xYQFILlImndPi7WGVU/u53hJ3aNyXZGdtWhHoCdkfLFMOzGmWrVk9ibqUreA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(39850400004)(366004)(376002)(346002)(396003)(33656002)(186003)(66946007)(26005)(76116006)(53546011)(966005)(66556008)(91956017)(7696005)(478600001)(64756008)(6506007)(66446008)(66476007)(5660300002)(8936002)(316002)(52536014)(4326008)(9686003)(8676002)(71200400001)(83380400001)(54906003)(55016002)(110136005)(2906002)(86362001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: IRj5EIQxXrB1s3uVwFUqKZu2uq2iDQpooSImvgBQ5wQhylPHmgHbxhPyVCl8tjkJIrJt6Tu+s1gLGg5TUu/guzHiD7jQqo/PbIzYFQ219vwBgjZLICNV4qPbwWizPxW2UTYT6OxYuQhhpqnJgw30nhvvGfwY8WXKi2aUVDz1IUjvtxyi8L0uIHY7zQXm9WfZ281s4uLjUdDECl/i3lgqhbR7aLVd6LfITCnihHVm0/PHAHaYs6jUceYo4nHAXxzMOEiMAxaJMfrxgl3gE/IqzRNIjgRkayt+sfUXysHawKgJrnSlF5GgWJyQWLQTRGYgpmJi1ZTCP+lj66SUeKuJu/5ZUwSRjBWBIPCUABdTDCxhSbwaz6TGJ0O0avK+LPdKUPJ1ahDgK4Hq9P82d0ym2rXJLLrLk1DThxqqM9RdVc3k+HtGijMi2DZ8Z/LKNsGIdMPhEEmVbC82b0keoQdREs5RI6QhLA86O7LOmUN5FMRnaZLr/ZU+wjNr126noiw/
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d66db1-d208-498a-01a5-08d816458a33
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 00:45:19.8678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COXKeBtfoIR8e0DxhufqWiAZ6Em+VLFiySL/uqzcooQrzFrQPwFIj3SCrJHMJBsGX/5zh4qsAKj/qgqnRZ7gww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0247
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05M0jSVq021420
X-loop: dm-devel@redhat.com
Cc: "dm-crypt@saout.de" <dm-crypt@saout.de>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"agk@redhat.com" <agk@redhat.com>,
	"kernel-team@cloudflare.com" <kernel-team@cloudflare.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/06/20 1:56, Mike Snitzer wrote:
> On Fri, Jun 19 2020 at 12:41pm -0400,
> Ignat Korchagin <ignat@cloudflare.com> wrote:
> 
>> This is a follow up from the long-forgotten [1], but with some more convincing
>> evidence. Consider the following script:
>>
>> #!/bin/bash -e
>>
>> # create 4G ramdisk
>> sudo modprobe brd rd_nr=1 rd_size=4194304
>>
>> # create a dm-crypt device with NULL cipher on top of /dev/ram0
>> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0' | sudo dmsetup create eram0
>>
>> # create a dm-crypt device with NULL cipher and custom force_inline flag
>> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0 1 force_inline' | sudo dmsetup create inline-eram0
>>
>> # read all data from /dev/ram0
>> sudo dd if=/dev/ram0 bs=4k iflag=direct | sha256sum
>>
>> # read the same data from /dev/mapper/eram0
>> sudo dd if=/dev/mapper/eram0 bs=4k iflag=direct | sha256sum
>>
>> # read the same data from /dev/mapper/inline-eram0
>> sudo dd if=/dev/mapper/inline-eram0 bs=4k iflag=direct | sha256sum
>>
>> This script creates a ramdisk (to eliminate hardware bias in the benchmark) and
>> two dm-crypt instances on top. Both dm-crypt instances use the NULL cipher
>> to eliminate potentially expensive crypto bias (the NULL cipher just uses memcpy
>> for "encyption"). The first instance is the current dm-crypt implementation from
>> 5.8-rc1, the second is the dm-crypt instance with a custom new flag enabled from
>> the patch attached to this thread. On my VM (Debian in VirtualBox with 4 cores
>> on 2.8 GHz Quad-Core Intel Core i7) I get the following output (formatted for
>> better readability):
>>
>> # plain ram0
>> 1048576+0 records in
>> 1048576+0 records out
>> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 21.2305 s, 202 MB/s
>> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
>>
>> # eram0 (current dm-crypt)
>> 1048576+0 records in
>> 1048576+0 records out
>> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 53.2212 s, 80.7 MB/s
>> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
>>
>> # inline-eram0 (patched dm-crypt)
>> 1048576+0 records in
>> 1048576+0 records out
>> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 21.3472 s, 201 MB/s
>> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
>>
>> As we can see, current dm-crypt implementation creates a significant IO
>> performance overhead (at least on small IO block sizes) for both latency and
>> throughput. We suspect offloading IO request processing into workqueues and
>> async threads is more harmful these days with the modern fast storage. I also
>> did some digging into the dm-crypt git history and much of this async processing
>> is not needed anymore, because the reasons it was added are mostly gone from the
>> kernel. More details can be found in [2] (see "Git archeology" section).
>>
>> We have been running the attached patch on different hardware generations in
>> more than 200 datacentres on both SATA SSDs and NVME SSDs and so far were very
>> happy with the performance benefits.
>>
>> [1]: https://www.spinics.net/lists/dm-crypt/msg07516.html
>> [2]: https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
>>
>> Ignat Korchagin (1):
>>   Add DM_CRYPT_FORCE_INLINE flag to dm-crypt target
>>
>>  drivers/md/dm-crypt.c | 55 +++++++++++++++++++++++++++++++++----------
>>  1 file changed, 43 insertions(+), 12 deletions(-)
>>
>> -- 
>> 2.20.1
>>
> 
> Hi,
> 
> I saw [2] and have been expecting something from cloudflare ever since.
> Nice to see this submission.
> 
> There is useful context in your 0th patch header.  I'll likely merge
> parts of this patch header with the more terse 1/1 header (reality is
> there only needed to be a single patch submission).
> 
> Will review and stage accordingly if all looks fine to me.  Mikulas,
> please have a look too.

Very timely: I was about to send a couple of patches to add zoned block device
support to dm-crypt :)

I used [1] work as a base to have all _write_ requests be processed inline in
the submitter context so that the submission order is preserved, avoiding the
potential reordering of sequential writes that the normal workqueue based
processing can generate. This inline processing is done only for writes. Reads
are unaffected.

To do this, I added a "inline_io" flag to struct convert_context which is
initialized in crypt_io_init() based on the BIO op.
kcryptd_crypt_write_io_submit() then uses this flag to call directly
generic_make_request() if inline_io is true.

This simplifies things compared to [1] since reads can still be processed as is,
so there are no issued with irq context and no need for a tasklet.

Should I send these patches as RFC to see what can be merged ? Or I can wait for
these patches and rebase on top.

> 
> Thanks,
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

