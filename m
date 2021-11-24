Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2C945B48C
	for <lists+dm-devel@lfdr.de>; Wed, 24 Nov 2021 07:51:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-254-iIN2xYdnOte3NgPwDehfKw-1; Wed, 24 Nov 2021 01:51:14 -0500
X-MC-Unique: iIN2xYdnOte3NgPwDehfKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFCE8102CB78;
	Wed, 24 Nov 2021 06:51:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FFB1100EBBF;
	Wed, 24 Nov 2021 06:51:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F4314A7C8;
	Wed, 24 Nov 2021 06:51:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AO6owXP003075 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Nov 2021 01:50:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 669024047279; Wed, 24 Nov 2021 06:50:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62F634047272
	for <dm-devel@redhat.com>; Wed, 24 Nov 2021 06:50:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F7F685A5BD
	for <dm-devel@redhat.com>; Wed, 24 Nov 2021 06:50:58 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-488-QODGIJ0tNfGOf7Cu37TtYw-1; Wed, 24 Nov 2021 01:50:54 -0500
X-MC-Unique: QODGIJ0tNfGOf7Cu37TtYw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id E12D568AFE; Wed, 24 Nov 2021 07:50:50 +0100 (CET)
Date: Wed, 24 Nov 2021 07:50:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20211124065050.GB7075@lst.de>
References: <20211109083309.584081-1-hch@lst.de>
	<20211109083309.584081-19-hch@lst.de>
	<CAPcyv4hDG9-BQHjuJnQUQLJhq=xmrNi+w-uiu6TnV4Rcf0VDfQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hDG9-BQHjuJnQUQLJhq=xmrNi+w-uiu6TnV4Rcf0VDfQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Mike Snitzer <snitzer@redhat.com>,
	linux-s390 <linux-s390@vger.kernel.org>, linux-erofs@lists.ozlabs.org,
	virtualization@lists.linux-foundation.org,
	linux-xfs <linux-xfs@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 18/29] fsdax: decouple zeroing from the iomap
 buffered I/O code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 23, 2021 at 01:46:35PM -0800, Dan Williams wrote:
> > +               const struct iomap_ops *ops)
> > +{
> > +       unsigned int blocksize = i_blocksize(inode);
> > +       unsigned int off = pos & (blocksize - 1);
> > +
> > +       /* Block boundary? Nothing to do */
> > +       if (!off)
> > +               return 0;
> 
> It took me a moment to figure out why this was correct. I see it was
> also copied from iomap_truncate_page(). It makes sense for DAX where
> blocksize >= PAGE_SIZE so it's always the case that the amount of
> capacity to zero relative to a page is from @pos to the end of the
> block. Is there something else that protects the blocksize < PAGE_SIZE
> case outside of DAX?
> 
> Nothing to change for this patch, just a question I had while reviewing.

This is a helper for truncate ->setattr, where everything outside the
block is deallocated.  So zeroing is only needed inside the block.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

