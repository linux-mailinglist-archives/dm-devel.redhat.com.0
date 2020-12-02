Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 518A32CCA17
	for <lists+dm-devel@lfdr.de>; Wed,  2 Dec 2020 23:56:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-v0G_lcowMCi-n8K43hb2Tw-1; Wed, 02 Dec 2020 17:56:42 -0500
X-MC-Unique: v0G_lcowMCi-n8K43hb2Tw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24A441005E61;
	Wed,  2 Dec 2020 22:56:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D060460BFA;
	Wed,  2 Dec 2020 22:56:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A36914BB7B;
	Wed,  2 Dec 2020 22:56:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B2MuOvm017123 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Dec 2020 17:56:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8A358D7B0A; Wed,  2 Dec 2020 22:56:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 840A8D7B02
	for <dm-devel@redhat.com>; Wed,  2 Dec 2020 22:56:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0CB7185A7BC
	for <dm-devel@redhat.com>; Wed,  2 Dec 2020 22:56:21 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-137-P27mh1vhMhGXMN9BVfU2TA-1; Wed, 02 Dec 2020 17:56:19 -0500
X-MC-Unique: P27mh1vhMhGXMN9BVfU2TA-1
Received: by mail-qv1-f66.google.com with SMTP id cv2so63015qvb.9
	for <dm-devel@redhat.com>; Wed, 02 Dec 2020 14:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=IBFDTpo6HCPZ58+V0bzhRqACm4PvOWR/Et5h/3XwaU8=;
	b=cW543Ta64uX30hmfLjd2L6qZRUVcHFWCULV06PwpBXWJsjmeW318KpZ9DlpH2Dq0PY
	axbbCixUUN+ybvOaV7iikewOEnWaaikJ0LbOVGZp5fHoyK9bIPo+g5XTHFAlltgFO3V6
	Zf0qHldv62NztI5mmSQ/UIeXcJ6Ff3Uhdqo0T/aklUvz7ZPsiT2ooKU5MS7BsLAOAxTI
	Y3bEOl95/KQfXHH/MTPbXEVq09rq0vmdbkxT4+At8twCIdBdzYw1eLzUBFzQdF/w0LJO
	FX7RhGVdj8jepO7c/stAJifMwfvRid3U6VVYRSOqW7jNXHyJrk9lqUK0/zeqI43BnqI3
	w5DA==
X-Gm-Message-State: AOAM531HPVn9EjABFjSdDU3r89dnQ7htaRyXSQBikBdiclHB5rCb976a
	syPnOMZY+ZLOdb/WKdKUyHc=
X-Google-Smtp-Source: ABdhPJwJibtRzDad60HT36HN6FnIXnXcdBaU9HV0uJhnDSuilp3rwyjJsTTbCkE48vAEqp+9FbP8ZA==
X-Received: by 2002:ad4:4ee7:: with SMTP id dv7mr420732qvb.43.1606949779283;
	Wed, 02 Dec 2020 14:56:19 -0800 (PST)
Received: from localhost ([2620:10d:c091:480::1:ec0f])
	by smtp.gmail.com with ESMTPSA id
	q123sm100474qke.28.2020.12.02.14.56.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Dec 2020 14:56:18 -0800 (PST)
Date: Wed, 2 Dec 2020 17:55:50 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <X8gbdmOWK46JTUwX@mtj.duckdns.org>
References: <20201201165424.2030647-1-hch@lst.de>
	<20201201165424.2030647-5-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201201165424.2030647-5-hch@lst.de>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
	linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-block@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 4/9] block: simplify submit_bio_checks a bit
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

On Tue, Dec 01, 2020 at 05:54:19PM +0100, Christoph Hellwig wrote:
> Merge a few checks for whole devices vs partitions to streamline the
> sanity checks.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

