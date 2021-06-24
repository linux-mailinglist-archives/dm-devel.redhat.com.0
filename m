Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 52E5A3B2774
	for <lists+dm-devel@lfdr.de>; Thu, 24 Jun 2021 08:34:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-uvFhXvu7OfiIMudWsVb90g-1; Thu, 24 Jun 2021 02:34:12 -0400
X-MC-Unique: uvFhXvu7OfiIMudWsVb90g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD431804144;
	Thu, 24 Jun 2021 06:34:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5CAA5D6A1;
	Thu, 24 Jun 2021 06:33:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33B5C4EA2A;
	Thu, 24 Jun 2021 06:33:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15O6XJ1w011873 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Jun 2021 02:33:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 741D55D6D7; Thu, 24 Jun 2021 06:33:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from deadmen.hmeau.com (ovpn-13-118.pek2.redhat.com [10.72.13.118])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C190D5D6A1;
	Thu, 24 Jun 2021 06:33:14 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
	id 1lwIun-0005DQ-BZ; Thu, 24 Jun 2021 14:32:41 +0800
Received: from herbert by gondobar with local (Exim 4.92)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1lwIuN-0000Wf-O4; Thu, 24 Jun 2021 14:32:15 +0800
Date: Thu, 24 Jun 2021 14:32:15 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <20210624063215.GA31721@gondor.apana.org.au>
References: <20210615132456.753241-1-hch@lst.de>
	<20210615132456.753241-2-hch@lst.de>
	<20210618030157.GA1905674@iweiny-DESK2.sc.intel.com>
	<20210618033728.GA16787@gondor.apana.org.au>
	<20210618181258.GC1905674@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
In-Reply-To: <20210618181258.GC1905674@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mike Snitzer <snitzer@redhat.com>, "David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>,
	Christoph Lameter <cl@gentwo.de>, ceph-devel@vger.kernel.org,
	linux-mips@vger.kernel.org, Dongsheng Yang <dongsheng.yang@easystack.cn>,
	linux-kernel@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	dm-devel@redhat.com,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ilya Dryomov <idryomov@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [PATCH] crypto: scatterwalk - Remove obsolete PageSlab
	check
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

On Fri, Jun 18, 2021 at 11:12:58AM -0700, Ira Weiny wrote:
>
> Interesting!  Thanks!
> 
> Digging around a bit more I found:
> 
> https://lore.kernel.org/patchwork/patch/439637/

Nice find.  So we can at least get rid of the PageSlab call from
the Crypto API.

---8<---
As it is now legal to call flush_dcache_page on slab pages we
no longer need to do the check in the Crypto API.

Reported-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/crypto/scatterwalk.h b/include/crypto/scatterwalk.h
index c837d0775474..7af08174a721 100644
--- a/include/crypto/scatterwalk.h
+++ b/include/crypto/scatterwalk.h
@@ -81,12 +81,7 @@ static inline void scatterwalk_pagedone(struct scatter_walk *walk, int out,
 		struct page *page;
 
 		page = sg_page(walk->sg) + ((walk->offset - 1) >> PAGE_SHIFT);
-		/* Test ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE first as
-		 * PageSlab cannot be optimised away per se due to
-		 * use of volatile pointer.
-		 */
-		if (ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE && !PageSlab(page))
-			flush_dcache_page(page);
+		flush_dcache_page(page);
 	}
 
 	if (more && walk->offset >= walk->sg->offset + walk->sg->length)
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

