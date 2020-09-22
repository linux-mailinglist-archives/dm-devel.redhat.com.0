Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5912737AC
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 02:49:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-DCdSbg3QOWCL8N8KtMGJ7A-1; Mon, 21 Sep 2020 20:49:43 -0400
X-MC-Unique: DCdSbg3QOWCL8N8KtMGJ7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6EDF1868401;
	Tue, 22 Sep 2020 00:49:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF00473681;
	Tue, 22 Sep 2020 00:49:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C620D1888B4C;
	Tue, 22 Sep 2020 00:49:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08M0nJ9F006391 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 20:49:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6AA9C2157F23; Tue, 22 Sep 2020 00:49:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65D072166B28
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 00:49:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED9F1800962
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 00:49:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-62-Evrg2ypzMeGljGjhsIwa0A-1; 
	Mon, 21 Sep 2020 20:49:13 -0400
X-MC-Unique: Evrg2ypzMeGljGjhsIwa0A-1
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
	[172.10.235.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B64BD23A61;
	Tue, 22 Sep 2020 00:49:11 +0000 (UTC)
Date: Mon, 21 Sep 2020 17:49:10 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200922004910.GD32959@sol.localdomain>
References: <20200909234422.76194-1-satyat@google.com>
	<20200909234422.76194-4-satyat@google.com>
MIME-Version: 1.0
In-Reply-To: <20200909234422.76194-4-satyat@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/3] dm: enable may_passthrough_inline_crypto
 on some targets
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 09, 2020 at 11:44:22PM +0000, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> dm-linear and dm-flakey obviously can pass through inline crypto support.
> 
> dm-zero should declare that it passes through inline crypto support, since
> any reads from dm-zero should return zeroes, and blk-crypto should not
> attempt to decrypt data returned from dm-zero.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  drivers/md/dm-flakey.c | 1 +
>  drivers/md/dm-linear.c | 1 +
>  drivers/md/dm-zero.c   | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/md/dm-flakey.c b/drivers/md/dm-flakey.c
> index a2cc9e45cbba..655286dacc35 100644
> --- a/drivers/md/dm-flakey.c
> +++ b/drivers/md/dm-flakey.c
> @@ -253,6 +253,7 @@ static int flakey_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	ti->num_discard_bios = 1;
>  	ti->per_io_data_size = sizeof(struct per_bio_data);
>  	ti->private = fc;
> +	ti->may_passthrough_inline_crypto = true;
>  	return 0;
>  
>  bad:
> diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
> index e1db43446327..6d81878e2ca8 100644
> --- a/drivers/md/dm-linear.c
> +++ b/drivers/md/dm-linear.c
> @@ -62,6 +62,7 @@ static int linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	ti->num_secure_erase_bios = 1;
>  	ti->num_write_same_bios = 1;
>  	ti->num_write_zeroes_bios = 1;
> +	ti->may_passthrough_inline_crypto = true;
>  	ti->private = lc;
>  	return 0;
>  
> diff --git a/drivers/md/dm-zero.c b/drivers/md/dm-zero.c
> index b65ca8dcfbdc..07e02f3a9cd1 100644
> --- a/drivers/md/dm-zero.c
> +++ b/drivers/md/dm-zero.c
> @@ -26,6 +26,7 @@ static int zero_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	 * Silently drop discards, avoiding -EOPNOTSUPP.
>  	 */
>  	ti->num_discard_bios = 1;
> +	ti->may_passthrough_inline_crypto = true;
>  
>  	return 0;
>  }

Isn't it wrong to set may_passthrough_inline_crypto on dm-zero?  First, there's
no actual underlying device associated with dm-zero, so the idea of dm-zero
"passing through" anything is strange.

Second, inline encryption is supposed to semantically operate on the original
bio.  I.e. if someone reads some data from dm-zero and they use a bio_crypt_ctx
that indicates the data should be decrypted, then I'd expect that either the bio
would fail, *or* it would return back data which is equal to the decryption of
the all-zeroes ciphertexts.

may_passthrough_inline_crypto=false would give that behavior.  Whereas with
may_passthrough_inline_crypto=true, the bio's encryption context may just be
ignored and reads will return all zeroes.

Of course, setting an encryption context for I/O to/from dm-zero isn't really
something that people would do anyway...  But it seems we shouldn't bother
setting may_passthrough_inline_crypto on it when it seems wrong.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

