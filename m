Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 074FA1662FC
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 17:32:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582216336;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+A9PE1Agz8oZDGXuALjduuRl6S0uFlQDPfJUehF6TDY=;
	b=g/3vL1f4K+kws9RQMfhKoQ3pfAr2TQei4vZ7mY5YCV0UGIzAoTYXXqnQSitUbkUaLVAlc7
	yPa+vgVxg6pB9z3qJIC+TH4NUfKGeIuj/HGgZLFxXs5PhXFgIDW7xZp4giRdZzyLNR8dEH
	exjepe89bDivC4bg7h+FXDEOCvBEVso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-RSix4YNONFK9RAZ4r9k40w-1; Thu, 20 Feb 2020 11:32:12 -0500
X-MC-Unique: RSix4YNONFK9RAZ4r9k40w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4838013FA;
	Thu, 20 Feb 2020 16:32:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E32A15C1D8;
	Thu, 20 Feb 2020 16:32:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77FED18089CD;
	Thu, 20 Feb 2020 16:32:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KGVwDn029789 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 11:31:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6CE732166B2C; Thu, 20 Feb 2020 16:31:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68DB12166B2B
	for <dm-devel@redhat.com>; Thu, 20 Feb 2020 16:31:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50E11101A55E
	for <dm-devel@redhat.com>; Thu, 20 Feb 2020 16:31:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-283-Tksh-XZmMXWIa47xFjT3Xg-1; Thu, 20 Feb 2020 11:31:47 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4oVo-0008FD-Vd; Thu, 20 Feb 2020 16:17:16 +0000
Date: Thu, 20 Feb 2020 08:17:16 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200220161716.GA31606@infradead.org>
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-3-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218214841.10076-3-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: Tksh-XZmMXWIa47xFjT3Xg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01KGVwDn029789
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org, vishal.l.verma@intel.com, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH v5 2/8] drivers/pmem: Allow
 pmem_clear_poison() to accept arbitrary offset and len
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Feb 18, 2020 at 04:48:35PM -0500, Vivek Goyal wrote:
> Currently pmem_clear_poison() expects offset and len to be sector aligned.
> Atleast that seems to be the assumption with which code has been written.
> It is called only from pmem_do_bvec() which is called only from pmem_rw_page()
> and pmem_make_request() which will only passe sector aligned offset and len.
> 
> Soon we want use this function from dax_zero_page_range() code path which
> can try to zero arbitrary range of memory with-in a page. So update this
> function to assume that offset and length can be arbitrary and do the
> necessary alignments as needed.
> 
> nvdimm_clear_poison() seems to assume offset and len to be aligned to
> clear_err_unit boundary. But this is currently internal detail and is
> not exported for others to use. So for now, continue to align offset and
> length to SECTOR_SIZE boundary. Improving it further and to align it
> to clear_err_unit boundary is a TODO item for future.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

This looks sensibel to me, but I'd really like to have Dan take at look.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

