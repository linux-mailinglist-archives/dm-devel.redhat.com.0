Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 589EE68C4C2
	for <lists+dm-devel@lfdr.de>; Mon,  6 Feb 2023 18:29:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675704568;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C57RaxgMC38ii2SbFFGmC8qyirsgHE/pbPmSJKDLuTc=;
	b=BPswvd8/mkJLP3ZedSGZSamAUHUty4gmjNIjVXipq+qD1Nc6bYisgykihLWWh1adbj107e
	7UWjo50GXe8CuOxgq0PPu4Q0hAxHPLTaYKtT3vzq4yEgBhAbEiD+10jkJaoj/ctX49/t0l
	SKcepVORPQaU7IwtCrORUjfyENA1WQw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-RaTavANBPtKuBTe1L0S3qg-1; Mon, 06 Feb 2023 12:29:26 -0500
X-MC-Unique: RaTavANBPtKuBTe1L0S3qg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD161800B23;
	Mon,  6 Feb 2023 17:29:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9B8C1121315;
	Mon,  6 Feb 2023 17:29:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 846D719465A2;
	Mon,  6 Feb 2023 17:29:12 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 189AE1946589
 for <dm-devel@listman.corp.redhat.com>; Mon,  6 Feb 2023 17:29:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B274B40C83B6; Mon,  6 Feb 2023 17:29:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAD4D40CF8E2
 for <dm-devel@redhat.com>; Mon,  6 Feb 2023 17:29:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C3033C42203
 for <dm-devel@redhat.com>; Mon,  6 Feb 2023 17:29:10 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-Vg7HJ1yhO1y03wTgt5mlhA-1; Mon, 06 Feb 2023 12:29:08 -0500
X-MC-Unique: Vg7HJ1yhO1y03wTgt5mlhA-1
Received: by mail-qt1-f181.google.com with SMTP id v17so13668044qto.3
 for <dm-devel@redhat.com>; Mon, 06 Feb 2023 09:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/FrP9fMYR82jRAmAW0QmGxlvWeMEFDYdTqEQD3Ix7oU=;
 b=GqFSioOFQb1lzHWutQTfxb4v04h7CfdMGq3BmCtC+bhreu8OOrb70m/KWJpLV1wAoe
 Wt3eWvrZ2YQyzveUy6FnNnMlcJS6MBn8P5R+dGsdE8K7o0BVJ3giE/GdLuqxH9jPJibW
 w8JfUqdUMwLn7nrdVc7Awy4aorXZGgLpg23pmxk1OfU69b0OMzRpE6gvWDMINQ7DmNp4
 x83ZD3zYty2XwSez5vAB2qO3XwN3DmEP6lWvGct9oqVCHCnxBR0riFqdve/BZJN2p93t
 XfHKtcd9wPngqIRhjpmqtgxad/5GQqDaEhuDnigkVnMMCSiq+rC/yJlI5+63pM7ZXkjF
 4NFQ==
X-Gm-Message-State: AO0yUKXWa2XCujVrloo1BJL7j8Gc3ODmunbk5k2QYRSmSh/BmE1jgV6S
 y35J3PpQ5E0oKOx/zhX7iYOd+po=
X-Google-Smtp-Source: AK7set88PegyfxPSUhpDYL1wKeHEutu8R092IP6zZRvoiYjEuTLO6pmSpIUQElcD/sBIBkgW1V2HAg==
X-Received: by 2002:ac8:5f95:0:b0:3ba:266f:103b with SMTP id
 j21-20020ac85f95000000b003ba266f103bmr38942qta.47.1675704548352; 
 Mon, 06 Feb 2023 09:29:08 -0800 (PST)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net.
 [68.160.166.30]) by smtp.gmail.com with ESMTPSA id
 b5-20020a37b205000000b00719165e9e72sm7647589qkf.91.2023.02.06.09.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 09:29:07 -0800 (PST)
Date: Mon, 6 Feb 2023 12:29:06 -0500
From: Mike Snitzer <snitzer@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Message-ID: <Y+E44kb3bJViytuh@redhat.com>
References: <Y+DUkqe1sagWaErA@gondor.apana.org.au>
 <E1pOydY-007zgU-U2@formenos.hmeau.com>
MIME-Version: 1.0
In-Reply-To: <E1pOydY-007zgU-U2@formenos.hmeau.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH 1/17] dm: Add scaffolding to change
 completion function signature
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
Cc: David Howells <dhowells@redhat.com>, dm-devel@redhat.com,
 keyrings@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Boris Pismenny <borisp@nvidia.com>, John Fastabend <john.fastabend@gmail.com>,
 Tyler Hicks <code@tyhicks.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Johan Hedberg <johan.hedberg@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>, ecryptfs@vger.kernel.org,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, netdev@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jon Maloy <jmaloy@redhat.com>,
 linux-bluetooth@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 06 2023 at  5:22P -0500,
Herbert Xu <herbert@gondor.apana.org.au> wrote:

> This patch adds temporary scaffolding so that the Crypto API
> completion function can take a void * instead of crypto_async_request.
> Once affected users have been converted this can be removed.
> 
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Acked-by: Mike Snitzer <snitzer@kernel.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

