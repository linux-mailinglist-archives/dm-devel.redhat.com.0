Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 261F54A9CA6
	for <lists+dm-devel@lfdr.de>; Fri,  4 Feb 2022 17:09:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-jCKbtET3O3akef6mcRdwhg-1; Fri, 04 Feb 2022 11:09:13 -0500
X-MC-Unique: jCKbtET3O3akef6mcRdwhg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8663484DA5C;
	Fri,  4 Feb 2022 16:09:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A4E6753ED;
	Fri,  4 Feb 2022 16:09:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A65B1809CB8;
	Fri,  4 Feb 2022 16:08:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 214G1mlT009807 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Feb 2022 11:01:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D19B6492D56; Fri,  4 Feb 2022 16:01:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCABE492D4A
	for <dm-devel@redhat.com>; Fri,  4 Feb 2022 16:01:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B49BC1C0783C
	for <dm-devel@redhat.com>; Fri,  4 Feb 2022 16:01:48 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-16-zMNYW1ugNeeqqfsqwJm5Rw-1; Fri, 04 Feb 2022 11:01:46 -0500
X-MC-Unique: zMNYW1ugNeeqqfsqwJm5Rw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9C75E68AA6; Fri,  4 Feb 2022 17:01:40 +0100 (CET)
Date: Fri, 4 Feb 2022 17:01:40 +0100
From: Christoph Hellwig <hch@lst.de>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20220204160140.GA6817@lst.de>
References: <20220203153843.szbd4n65ru4fx5hx@garbanzo>
	<CGME20220203165248uscas1p1f0459e548743e6be26d13d3ed8aa4902@uscas1p1.samsung.com>
	<20220203165238.GA142129@dhcp-10-100-145-180.wdc.com>
	<20220203195155.GB249665@bgt-140510-bm01>
	<863d85e3-9a93-4d8c-cf04-88090eb4cc02@nvidia.com>
	<2bbed027-b9a1-e5db-3a3d-90c40af49e09@opensource.wdc.com>
	<9d5d0b50-2936-eac3-12d3-a309389e03bf@nvidia.com>
	<20220204082445.hczdiy2uhxfi3x2g@ArmHalley.local>
	<4d5410a5-93c3-d73c-6aeb-2c1c7f940963@nvidia.com>
	<befa49b3-7606-a3ce-24f7-e184e3df41a3@suse.de>
MIME-Version: 1.0
In-Reply-To: <befa49b3-7606-a3ce-24f7-e184e3df41a3@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: dm-devel@redhat.com
Cc: "djwong@kernel.org" <djwong@kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"clm@fb.com" <clm@fb.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Adam Manzanares <a.manzanares@samsung.com>,
	"osandov@fb.com" <osandov@fb.com>,
	"msnitzer@redhat.com >> msnitzer@redhat.com" <msnitzer@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Christoph Hellwig <hch@lst.de>,
	"roland@purestorage.com" <roland@purestorage.com>,
	"zach.brown@ni.com" <zach.brown@ni.com>,
	"dsterba@suse.com" <dsterba@suse.com>,
	Chaitanya Kulkarni <chaitanyak@nvidia.com>,
	Javier =?iso-8859-1?Q?Gonz=E1lez?= <javier@javigon.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Keith Busch <kbusch@kernel.org>,
	"Frederick.Knight@netapp.com" <Frederick.Knight@netapp.com>,
	Jens Axboe <axboe@kernel.dk>, "tytso@mit.edu" <tytso@mit.edu>,
	Kanchan Joshi <joshi.k@samsung.com>,
	"martin.petersen@oracle.com >> Martin K. Petersen"
	<martin.petersen@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>,
	"jack@suse.com" <jack@suse.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>
Subject: Re: [dm-devel] [RFC PATCH 3/3] nvme: add the "debug" host driver
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 04, 2022 at 03:15:02PM +0100, Hannes Reinecke wrote:
>> ZNS kernel code testing is also done on QEMU, I've also fixed
>> bugs in the ZNS kernel code which are discovered on QEMU and I've not
>> seen any issues with that. Given that simple copy feature is way smaller
>> than ZNS it will less likely to suffer from slowness and etc (listed
>> above) in QEMU.
>>
>> my point is if we allow one, we will be opening floodgates and we need
>> to be careful not to bloat the code unless it is _absolutely
>> necessary_ which I don't think it is based on the simple copy
>> specification.
>>
>
> I do have a slightly different view on the nvme target code; it should 
> provide the necessary means to test the nvme host code.
> And simple copy is on of these features, especially as it will operate as 
> an exploiter of the new functionality.

Well, in general I'd like to have every useful feature supported in
nvmet, because it serves both testing and production.  If a feature
isn't all that useful (and there are lots of those in nvme these days)
we don't need to support in nvmet, but probably neither in the host code.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

