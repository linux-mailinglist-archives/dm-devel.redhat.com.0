Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E664A26D790
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 11:25:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-YrlttZUUM_ebA9kgQCaQXw-1; Thu, 17 Sep 2020 05:25:46 -0400
X-MC-Unique: YrlttZUUM_ebA9kgQCaQXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A95498018A7;
	Thu, 17 Sep 2020 09:25:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FC2175143;
	Thu, 17 Sep 2020 09:25:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 994296EF50;
	Thu, 17 Sep 2020 09:25:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08H9PYmQ010119 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 05:25:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0EB882028CCE; Thu, 17 Sep 2020 09:25:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 092502026F94
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 09:25:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFE788007A4
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 09:25:31 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-547-SDSwZVVKPc-JNgv4nfcSQw-1;
	Thu, 17 Sep 2020 05:25:26 -0400
X-MC-Unique: SDSwZVVKPc-JNgv4nfcSQw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CA2C7AC12;
	Thu, 17 Sep 2020 09:25:58 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id BC6F61E12E1; Thu, 17 Sep 2020 11:25:24 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:25:24 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200917092524.GC7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-11-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200910144833.742260-11-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 10/12] bdi: replace BDI_CAP_STABLE_WRITES
 with a queue and a sb flag
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu 10-09-20 16:48:30, Christoph Hellwig wrote:
> The BDI_CAP_STABLE_WRITES is one of the few bits of information in the
> backing_dev_info shared between the block drivers and the writeback code.
> To help untangling the dependency replace it with a queue flag and a
> superblock flag derived from it.  This also helps with the case of e.g.
> a file system requiring stable writes due to its own checksumming, but
> not forcing it on other users of the block device like the swap code.
> 
> One downside is that we can't support the stable_pages_required bdi
> attribute in sysfs anymore.  It is replaced with a queue attribute, that
> can also be made writable for easier testing.
  ^^^^^^^^^^^^^^^^
  is also made

For a while I was confused thinking that the new attribute is not writeable
but when I checked the code I saw that it is.

Not supporting stable_pages_required attribute is not nice but probably it
isn't widely used. Maybe the deprecation message can even mention to use
the queue attribute? Otherwise the patch looks good to me so feel free to
add:

Reviewed-by: Jan Kara <jack@suse.cz>


								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

