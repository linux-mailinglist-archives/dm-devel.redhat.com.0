Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 703BD161965
	for <lists+dm-devel@lfdr.de>; Mon, 17 Feb 2020 19:08:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581962891;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1Z5uXl4cwg0XoSYvwsbSWBrqMU9aJK4Rg6APnz3idOk=;
	b=Dy1PL6o9PBXNAUKgYiWQn+BR1gjDjybl7r4ayGr4cEIOy7a1k/bSqwV20wLoDMVnGaV//q
	fkEjtK48HF34ivgs+rHIxeUPJm3BlZXQir1tJOUQ+O2ca7zcH1vPgQ7aXPlAJIdlgvzXXz
	17fqs1VWwR7GMwaMLVwg8Z16uzEq6bU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-4ZW3xdi2OpyxCKae7rqotQ-1; Mon, 17 Feb 2020 13:08:08 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E3B9800D53;
	Mon, 17 Feb 2020 18:08:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC9415DA2C;
	Mon, 17 Feb 2020 18:07:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D810B1832DE7;
	Mon, 17 Feb 2020 18:07:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HI4x2q021666 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:04:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AED6119756; Mon, 17 Feb 2020 18:04:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B21C119C69;
	Mon, 17 Feb 2020 18:04:56 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 2E8782257D2; Mon, 17 Feb 2020 13:04:56 -0500 (EST)
Date: Mon, 17 Feb 2020 13:04:56 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200217180456.GB24816@redhat.com>
References: <20200207202652.1439-1-vgoyal@redhat.com>
	<20200207202652.1439-2-vgoyal@redhat.com>
	<20200217132138.GB14490@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217132138.GB14490@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, dm-devel@redhat.com, linux-nvdimm@lists.01.org
Subject: Re: [dm-devel] [PATCH v3 1/7] pmem: Add functions for
 reading/writing page to/from pmem
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
X-MC-Unique: 4ZW3xdi2OpyxCKae7rqotQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Feb 17, 2020 at 05:21:38AM -0800, Christoph Hellwig wrote:
> On Fri, Feb 07, 2020 at 03:26:46PM -0500, Vivek Goyal wrote:
> > +static blk_status_t pmem_do_bvec(struct pmem_device *pmem, struct page *page,
> > +			unsigned int len, unsigned int off, unsigned int op,
> > +			sector_t sector)
> > +{
> > +	if (!op_is_write(op))
> > +		return pmem_do_read(pmem, page, off, sector, len);
> > +
> > +	return pmem_do_write(pmem, page, off, sector, len);
> 
> Why not:
> 
> 	if (op_is_write(op))
> 		return pmem_do_write(pmem, page, off, sector, len);
> 	return pmem_do_read(pmem, page, off, sector, len);
> 
> that being said I don't see the point of this pmem_do_bvec helper given
> that it only has two callers.

Ok, I am about to post V4 of patches and I got rid of pmem_do_bvec() and
callers are directly calling pmem_do_read()/pmem_do_write().

Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

