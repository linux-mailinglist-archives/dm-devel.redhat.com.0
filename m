Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A70F02D0DA4
	for <lists+dm-devel@lfdr.de>; Mon,  7 Dec 2020 11:00:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-BV1znuw-PHanf_CZVBXUuw-1; Mon, 07 Dec 2020 05:00:21 -0500
X-MC-Unique: BV1znuw-PHanf_CZVBXUuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33CBE102CB7D;
	Mon,  7 Dec 2020 09:59:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E938E10023B0;
	Mon,  7 Dec 2020 09:59:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C7B24BB7B;
	Mon,  7 Dec 2020 09:59:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B4EeHEh026909 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Dec 2020 09:40:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5A12B20296B6; Fri,  4 Dec 2020 14:40:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 534B7200E21C
	for <dm-devel@redhat.com>; Fri,  4 Dec 2020 14:40:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23D56858287
	for <dm-devel@redhat.com>; Fri,  4 Dec 2020 14:40:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-19-mUaH_0pZMd-73qw7Tthfug-1; 
	Fri, 04 Dec 2020 09:40:11 -0500
X-MC-Unique: mUaH_0pZMd-73qw7Tthfug-1
Date: Fri, 4 Dec 2020 23:40:03 +0900
From: Keith Busch <kbusch@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20201204144003.GA8868@redsun51.ssa.fujisawa.hgst.com>
References: <CGME20201204094719epcas5p23b3c41223897de3840f92ae3c229cda5@epcas5p2.samsung.com>
	<20201204094659.12732-1-selvakuma.s1@samsung.com>
	<CH2PR04MB6522F1188557C829285ED5E8E7F10@CH2PR04MB6522.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CH2PR04MB6522F1188557C829285ED5E8E7F10@CH2PR04MB6522.namprd04.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 07 Dec 2020 04:59:37 -0500
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	SelvaKumar S <selvakuma.s1@samsung.com>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"selvajove@gmail.com" <selvajove@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"nj.shetty@samsung.com" <nj.shetty@samsung.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"joshi.k@samsung.com" <joshi.k@samsung.com>,
	"javier.gonz@samsung.com" <javier.gonz@samsung.com>,
	"hch@lst.de" <hch@lst.de>
Subject: Re: [dm-devel] [RFC PATCH v2 0/2] add simple copy support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 04, 2020 at 11:25:12AM +0000, Damien Le Moal wrote:
> On 2020/12/04 20:02, SelvaKumar S wrote:
> > This patchset tries to add support for TP4065a ("Simple Copy Command"),
> > v2020.05.04 ("Ratified")
> > 
> > The Specification can be found in following link.
> > https://nvmexpress.org/wp-content/uploads/NVM-Express-1.4-Ratified-TPs-1.zip
> > 
> > This is an RFC. Looking forward for any feedbacks or other alternate
> > designs for plumbing simple copy to IO stack.
> > 
> > Simple copy command is a copy offloading operation and is  used to copy
> > multiple contiguous ranges (source_ranges) of LBA's to a single destination
> > LBA within the device reducing traffic between host and device.
> > 
> > This implementation accepts destination, no of sources and arrays of
> > source ranges from application and attach it as payload to the bio and
> > submits to the device.
> > 
> > Following limits are added to queue limits and are exposed in sysfs
> > to userspace
> > 	- *max_copy_sectors* limits the sum of all source_range length
> > 	- *max_copy_nr_ranges* limits the number of source ranges
> > 	- *max_copy_range_sectors* limit the maximum number of sectors
> > 		that can constitute a single source range.
> 
> Same comment as before. I think this is a good start, but for this to be really
> useful to users and kernel components alike, this really needs copy emulation
> for drives that do not have a native copy feature, similarly to what write zeros
> handling for instance: if the drive does not have a copy command (simple copy
> for NVMe or XCOPY for scsi), then the block layer should issue read/write
> commands to seamlessly execute the copy. Otherwise, this will only serve a small
> niche for users and will not be optimal for FS and DM drivers that could be
> simplified with a generic block layer copy functionality.
> 
> This is my 10 cents though, others may differ about this.

Yes, I agree that copy emulation support should be included with the
hardware enabled solution.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

