Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 055704360DF
	for <lists+dm-devel@lfdr.de>; Thu, 21 Oct 2021 13:55:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-u7UFko3uN8KvkhYvsWvNzw-1; Thu, 21 Oct 2021 07:55:49 -0400
X-MC-Unique: u7UFko3uN8KvkhYvsWvNzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88447802682;
	Thu, 21 Oct 2021 11:55:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 921386A904;
	Thu, 21 Oct 2021 11:55:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B1004A703;
	Thu, 21 Oct 2021 11:55:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LBtIuf014587 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 07:55:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 84538D1BA8; Thu, 21 Oct 2021 11:55:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CCB5D0180
	for <dm-devel@redhat.com>; Thu, 21 Oct 2021 11:55:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B76FF1066681
	for <dm-devel@redhat.com>; Thu, 21 Oct 2021 11:55:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-96-S_u4qGobMR2xcVdGwnaRbw-1; Thu, 21 Oct 2021 07:55:14 -0400
X-MC-Unique: S_u4qGobMR2xcVdGwnaRbw-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mdW7H-007KJP-3a; Thu, 21 Oct 2021 11:20:11 +0000
Date: Thu, 21 Oct 2021 04:20:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jane Chu <jane.chu@oracle.com>
Message-ID: <YXFM64mFLN8dagrY@infradead.org>
References: <20211021001059.438843-1-jane.chu@oracle.com>
	<20211021001059.438843-3-jane.chu@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20211021001059.438843-3-jane.chu@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: nvdimm@lists.linux.dev, dave.jiang@intel.com, snitzer@redhat.com,
	djwong@kernel.org, david@fromorbit.com,
	linux-kernel@vger.kernel.org, willy@infradead.org,
	hch@infradead.org, dm-devel@redhat.com, vgoyal@redhat.com,
	vishal.l.verma@intel.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com, ira.weiny@intel.com,
	linux-xfs@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 2/6] dax: prepare dax_direct_access() API
 with DAXDEV_F_RECOVERY flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 20, 2021 at 06:10:55PM -0600, Jane Chu wrote:
> @@ -156,8 +156,8 @@ bool generic_fsdax_supported(struct dax_device *dax_dev,
>  	}
>  
>  	id = dax_read_lock();
> -	len = dax_direct_access(dax_dev, pgoff, 1, &kaddr, &pfn);
> -	len2 = dax_direct_access(dax_dev, pgoff_end, 1, &end_kaddr, &end_pfn);
> +	len = dax_direct_access(dax_dev, pgoff, 1, &kaddr, &pfn, 0);
> +	len2 = dax_direct_access(dax_dev, pgoff_end, 1, &end_kaddr, &end_pfn, 0);

FYI, I have a series killing this code.  But either way please avoid
these overly long lines.

>  long dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff, long nr_pages,
> -		void **kaddr, pfn_t *pfn)
> +		void **kaddr, pfn_t *pfn, unsigned long flags)

API design: I'd usually expect flags before output paramters.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

