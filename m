Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 638FF5809C5
	for <lists+dm-devel@lfdr.de>; Tue, 26 Jul 2022 05:06:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658804785;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gcJhxGB0iWhhcaoRZK9TUdD0uY5Fo7cyJmTODGtYUOA=;
	b=K3byjgggxjMT8BLg3OIVrb3LWmZc7LamyzSipNoplPGCfCHhzOOzBKHPZMzyvnee7hDnhK
	/OoAlVEzOn1ObXcI498HGfEj89h/88Ud1LZUylp5WjjOFh8uA5MiJJ6ME6HR360NtWYFtF
	LbzKx3fzGnjT1KaZVC21qyUgLy/RFkw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-pLJrhpcXNqC5xUX8zylARA-1; Mon, 25 Jul 2022 23:06:23 -0400
X-MC-Unique: pLJrhpcXNqC5xUX8zylARA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B95E61C08966;
	Tue, 26 Jul 2022 03:06:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18D732166B26;
	Tue, 26 Jul 2022 03:06:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 355591945D8F;
	Tue, 26 Jul 2022 03:06:11 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A0A71945D86
 for <dm-devel@listman.corp.redhat.com>; Tue, 26 Jul 2022 03:06:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0C91F2026D07; Tue, 26 Jul 2022 03:06:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07A6F2026D64
 for <dm-devel@redhat.com>; Tue, 26 Jul 2022 03:06:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E12FA101A54E
 for <dm-devel@redhat.com>; Tue, 26 Jul 2022 03:06:07 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-H1HvcHXcO3W2XdwJ0czVuA-1; Mon, 25 Jul 2022 23:06:05 -0400
X-MC-Unique: H1HvcHXcO3W2XdwJ0czVuA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42FA1B8116D;
 Tue, 26 Jul 2022 03:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE69AC341C6;
 Tue, 26 Jul 2022 03:06:02 +0000 (UTC)
Date: Mon, 25 Jul 2022 20:06:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <Yt9aGRXNNPGZFvld@sol.localdomain>
References: <20220722093823.4158756-1-nhuck@google.com>
 <20220722093823.4158756-4-nhuck@google.com>
 <Yt9KTzXUeA8xAiGv@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yt9KTzXUeA8xAiGv@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH 3/3] dm-verity: Add try_verify_in_tasklet
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
Cc: Mike Snitzer <snitzer@kernel.org>, linux-kernel@vger.kernel.org,
 Nathan Huckleberry <nhuck@google.com>, dm-devel@redhat.com,
 Sami Tolvanen <samitolvanen@google.com>, Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 25, 2022 at 09:58:39PM -0400, Mike Snitzer wrote:
> 
> > @@ -1156,7 +1217,7 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
> >  		goto bad;
> >  	}
> >  
> > -	v->tfm = crypto_alloc_ahash(v->alg_name, 0, 0);
> > +	v->tfm = crypto_alloc_ahash(v->alg_name, 0, CRYPTO_ALG_ASYNC);
> >  	if (IS_ERR(v->tfm)) {
> >  		ti->error = "Cannot initialize hash function";
> >  		r = PTR_ERR(v->tfm);
> 
> This hunk that adds the CRYPTO_ALG_ASYNC flag _seems_ unrelated.

I believe it's needed to ensure that only a synchronous algorithm is allocated,
so that verity_hash_update() doesn't have to sleep during the tasklet.  It
should be conditional on v->use_tasklet, though.

> @@ -321,14 +320,12 @@ static int verity_verify_level(struct dm_verity *v, struct dm_verity_io *io,
>  		if (likely(memcmp(verity_io_real_digest(v, io), want_digest,
>  				  v->digest_size) == 0))
>  			aux->hash_verified = 1;
> -		else if (io->in_tasklet) {
> +		else if (io->in_tasklet)
>  			/*
>  			 * FEC code cannot be run in a tasklet since it may
> -			 * sleep.  We need to resume execution in a work-queue
> -			 * to handle FEC.
> +			 * sleep, so fallback to using a work-queue.
>  			 */
>  			return -EAGAIN;
> -		}


Doesn't this need to be:

			r = -EAGAIN;
			goto release_ret_r;

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

