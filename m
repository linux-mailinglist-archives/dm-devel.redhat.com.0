Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FCC4F5477
	for <lists+dm-devel@lfdr.de>; Wed,  6 Apr 2022 07:05:08 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-rmWp7B1UOaCzh2wdVBU2aA-1; Wed, 06 Apr 2022 01:05:05 -0400
X-MC-Unique: rmWp7B1UOaCzh2wdVBU2aA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 355A4811E80;
	Wed,  6 Apr 2022 05:05:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B0A71415125;
	Wed,  6 Apr 2022 05:04:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BFABA193F6E3;
	Wed,  6 Apr 2022 05:04:55 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0B03019451F3
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Apr 2022 05:04:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D78FFC27DB8; Wed,  6 Apr 2022 05:04:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3103C27DB7
 for <dm-devel@redhat.com>; Wed,  6 Apr 2022 05:04:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7D4B380392D
 for <dm-devel@redhat.com>; Wed,  6 Apr 2022 05:04:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-UgSuFiJsPNKbI5GerVaWFA-1; Wed, 06 Apr 2022 01:04:52 -0400
X-MC-Unique: UgSuFiJsPNKbI5GerVaWFA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nbxqX-003nIX-Gh; Wed, 06 Apr 2022 05:04:45 +0000
Date: Tue, 5 Apr 2022 22:04:45 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jane Chu <jane.chu@oracle.com>
Message-ID: <Yk0fbUs584vRprMg@infradead.org>
References: <20220405194747.2386619-1-jane.chu@oracle.com>
 <20220405194747.2386619-6-jane.chu@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20220405194747.2386619-6-jane.chu@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH v7 5/6] pmem: refactor pmem_clear_poison()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: nvdimm@lists.linux.dev, dave.jiang@intel.com, snitzer@redhat.com,
 djwong@kernel.org, x86@kernel.org, david@fromorbit.com,
 linux-kernel@vger.kernel.org, willy@infradead.org, hch@infradead.org,
 dm-devel@redhat.com, vgoyal@redhat.com, vishal.l.verma@intel.com,
 linux-fsdevel@vger.kernel.org, dan.j.williams@intel.com, ira.weiny@intel.com,
 linux-xfs@vger.kernel.org, agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 05, 2022 at 01:47:46PM -0600, Jane Chu wrote:
> +	pmem_clear_bb(pmem, to_sect(pmem, offset), cleared >> SECTOR_SHIFT);
> +	return (cleared < len) ? BLK_STS_IOERR : BLK_STS_OK;

No need for the braces.  That being said perosnally I find a simple:

	if (cleared < len)
		return BLK_STS_IOERR;
	return BLK_STS_OK;

much easier to read anyway.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

