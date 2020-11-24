Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B11C32C3273
	for <lists+dm-devel@lfdr.de>; Tue, 24 Nov 2020 22:21:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-bGTHvtiUP8e53V6E_tV66w-1; Tue, 24 Nov 2020 16:21:00 -0500
X-MC-Unique: bGTHvtiUP8e53V6E_tV66w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D409F87952B;
	Tue, 24 Nov 2020 21:20:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0F8160BE5;
	Tue, 24 Nov 2020 21:20:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16C90180954D;
	Tue, 24 Nov 2020 21:20:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOLKmHM021264 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 16:20:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D6F292166B27; Tue, 24 Nov 2020 21:20:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D13A92166B2A
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 21:20:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9C93858299
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 21:20:46 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-241-XwjNYKnuOoyQBPhzcbSMIw-1; Tue, 24 Nov 2020 16:20:42 -0500
X-MC-Unique: XwjNYKnuOoyQBPhzcbSMIw-1
Received: by mail-qk1-f194.google.com with SMTP id n132so577032qke.1;
	Tue, 24 Nov 2020 13:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=ev/F4l5kU0JVd8J9T+Hn7/Emi68DyGqwAl9VsbylUp0=;
	b=RwguTIavQv1/b87sWvm29c1xWtvwXC3j4hQwqeqCz1xvXlkDEUwnsc8ZScpnp8/fvg
	KHShQO7s6mQGdinwjNHPxNmeOpewNMvoL486mpyQEHUvv2+ZO1VQCZ8hSyLlXIdDc+jh
	KXw0vh5zpnw0pIkpMhRjkM1k7X/H/uvptqYkPy5+V46owFW/BYlcpgQirt7pYEywpFGw
	i2CQM5gh7eMcX9tdBJWG9oAxdjdImIDRrN7zjnSgKyo8zMQn9Ai6w8LcQcYhhr2dnZ/W
	ZNP/SAsXrM99ZwpNj/02t7Y0/WY0oHBq4aOdHvTPxyDb0Fz1768HM47BVM7T5vvzJp3r
	TPvA==
X-Gm-Message-State: AOAM532mHvq6yuJiejPkipqYTaLlQgE49rvhaP21tOrbqmsxYRVXFk7Y
	tY/RjoBd5oG4p3btgOd+zbI=
X-Google-Smtp-Source: ABdhPJxVPExCrpl6SBnHr8hh5lACFOCmcWgKuDYnGDx1xBxinXihB0MFiLxOfh+ARQAqrCZ49K/lyA==
X-Received: by 2002:a37:7481:: with SMTP id p123mr176688qkc.424.1606252841332; 
	Tue, 24 Nov 2020 13:20:41 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
	by smtp.gmail.com with ESMTPSA id b33sm298244qta.62.2020.11.24.13.20.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Nov 2020 13:20:40 -0800 (PST)
Date: Tue, 24 Nov 2020 16:20:18 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <X715EkY5mafgeJWZ@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
	<20201124132751.3747337-29-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-29-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Subject: Re: [dm-devel] [PATCH 28/45] block: simplify part_to_disk
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2020 at 02:27:34PM +0100, Christoph Hellwig wrote:
> Now that struct hd_struct has a block_device pointer use that to
> find the disk.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

