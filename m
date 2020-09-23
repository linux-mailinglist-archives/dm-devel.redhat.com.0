Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F3D70275B58
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 17:16:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-LbqjC43QMnSutE4AoFaa3A-1; Wed, 23 Sep 2020 11:16:50 -0400
X-MC-Unique: LbqjC43QMnSutE4AoFaa3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E9126409D;
	Wed, 23 Sep 2020 15:16:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51F675DA7C;
	Wed, 23 Sep 2020 15:16:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87E8844A6A;
	Wed, 23 Sep 2020 15:16:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NFGH7r027647 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 11:16:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B45911753FC; Wed, 23 Sep 2020 15:16:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5637E11753FA
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 15:16:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED9F880352B
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 15:16:14 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-447-D11NO0nhOR2jes1VB84EAQ-1;
	Wed, 23 Sep 2020 11:16:12 -0400
X-MC-Unique: D11NO0nhOR2jes1VB84EAQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id D31FF6736F; Wed, 23 Sep 2020 17:16:06 +0200 (CEST)
Date: Wed, 23 Sep 2020 17:16:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20200923151606.GB16073@lst.de>
References: <20200921080734.452759-1-hch@lst.de>
	<20200921080734.452759-6-hch@lst.de>
	<20200922084954.GC16464@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20200922084954.GC16464@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Justin Sanders <justin@coraid.com>, Hans de Goede <hdegoede@redhat.com>,
	Richard Weinberger <richard@nod.at>, cgroups@vger.kernel.org,
	Minchan Kim <minchan@kernel.org>, linux-bcache@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org,
	David Sterba <dsterba@suse.com>, Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 05/13] bdi: initialize ->ra_pages and
 ->io_pages in bdi_init
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 22, 2020 at 10:49:54AM +0200, Jan Kara wrote:
> On Mon 21-09-20 10:07:26, Christoph Hellwig wrote:
> > Set up a readahead size by default, as very few users have a good
> > reason to change it.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Acked-by: David Sterba <dsterba@suse.com> [btrfs]
> > Acked-by: Richard Weinberger <richard@nod.at> [ubifs, mtd]
> 
> The patch looks good to me. You can add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> 
> I'd just prefer if the changelog explicitely mentioned that this patch
> results in enabling readahead for coda, ecryptfs, and orangefs... Just in
> case someone bisects some issue down to this patch :).

Ok, I've updated the changelog.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

