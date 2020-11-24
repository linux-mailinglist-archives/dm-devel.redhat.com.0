Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8B92C2EDA
	for <lists+dm-devel@lfdr.de>; Tue, 24 Nov 2020 18:39:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-Jd35bRCVM8yNYKiJTFJpqA-1; Tue, 24 Nov 2020 12:39:18 -0500
X-MC-Unique: Jd35bRCVM8yNYKiJTFJpqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D1BC94DCF;
	Tue, 24 Nov 2020 17:39:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4B5B1992D;
	Tue, 24 Nov 2020 17:39:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8883B180954D;
	Tue, 24 Nov 2020 17:39:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOHd76a022062 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 12:39:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 300F82026D3C; Tue, 24 Nov 2020 17:39:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA8C2026D38
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 17:39:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24099805C3F
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 17:39:02 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-19-RurSDaVrM1amiTGYSm-Qog-1; Tue, 24 Nov 2020 12:38:57 -0500
X-MC-Unique: RurSDaVrM1amiTGYSm-Qog-1
Received: by mail-qv1-f65.google.com with SMTP id q7so10970102qvt.12;
	Tue, 24 Nov 2020 09:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=Km12pVmBeWPgkRcOQAU5l84XavjRPJ4jqz28aKaNPFE=;
	b=KTz/rAV4FbuXhqQIz+Z7FRRy4AHJKYigAzzZsx/H+zd2lS0/F8VHRwpRSSJQCrQ8P7
	8SSj8/DflDLXnkd1vUwiy1cbPhFQCAewoAqTawrn2Iix3mP+bvApa795Gma1S92/h2x/
	674TKFcYQ7mbhb06sZetTf6npf4PWZQn4badkmHauZrxBcgpefG+JIRW0ZFynY3CYJt8
	p4UqFPra3VXVgMbMqWb8Dk13GYgjp58ZKoFG7ilDFQpan/MNtN+akPxmmkGMq+gMBe4T
	4GaDFN8ni+17jwLM2n+mQDhQ0uLuUiaE5g7eLOc6ZDc7JKhjoq7DIQCtqbGSBH6SHVNQ
	t/wA==
X-Gm-Message-State: AOAM530xAZE/Szwz2ySk9eZblqtr5BLmiZyu7usg1NvM9vg4iTbaFput
	Zr+GDet24MREBYGfVQkp9PTAAdl7/E+g1A==
X-Google-Smtp-Source: ABdhPJx2viG2YUIcT9pxnUmh9SMKJ+iaGPuLa9sp1d1smXeKSZjMmg4Jo+Hs7YyRPHzhOtS6yXj/uA==
X-Received: by 2002:a0c:f7cc:: with SMTP id f12mr5949753qvo.0.1606239537123;
	Tue, 24 Nov 2020 09:38:57 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
	by smtp.gmail.com with ESMTPSA id
	b3sm13138042qte.85.2020.11.24.09.38.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Nov 2020 09:38:56 -0800 (PST)
Date: Tue, 24 Nov 2020 12:38:34 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <X71FGgQtvXHTHU0V@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
	<20201124132751.3747337-18-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-18-hch@lst.de>
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 17/45] init: refactor name_to_dev_t
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2020 at 02:27:23PM +0100, Christoph Hellwig wrote:
> Split each case into a self-contained helper, and move the block
> dependent code entirely under the pre-existing #ifdef CONFIG_BLOCK.
> This allows to remove the blk_lookup_devt stub in genhd.h.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

