Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 457FE748EB7
	for <lists+dm-devel@lfdr.de>; Wed,  5 Jul 2023 22:18:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688588332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yhtio7T5zJnE4WtvvhE4gwoalNCZmBAO2PQWApxEwRg=;
	b=GBr/+Vh55S0UatbDwdsjg4zODpyPHbKTiEy+P4RDTxvLSb8KLc/ypue9ZewS4GCgvEDdH2
	w6Lk/FF5kfNmmq/NJDpTbgrBLNIkBhkqxVGn40BF2u+cvrT9JZ62Hp37LqouwAO4sEmL/M
	/j8W6nri5HsiB47cISriRoqpr4UEhfQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-cczCvvjDP_SpL0bHVaJ8mQ-1; Wed, 05 Jul 2023 16:18:38 -0400
X-MC-Unique: cczCvvjDP_SpL0bHVaJ8mQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD4DD1C31C43;
	Wed,  5 Jul 2023 20:18:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE347492C13;
	Wed,  5 Jul 2023 20:18:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B219119465BC;
	Wed,  5 Jul 2023 20:18:20 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4A2821946588
 for <dm-devel@listman.corp.redhat.com>; Wed,  5 Jul 2023 20:18:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1944640C6CCD; Wed,  5 Jul 2023 20:18:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 120B540C6F5A
 for <dm-devel@redhat.com>; Wed,  5 Jul 2023 20:18:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EFE0101A529
 for <dm-devel@redhat.com>; Wed,  5 Jul 2023 20:18:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-94Nio12ROK2_QDAqpaAWPw-1; Wed, 05 Jul 2023 16:18:15 -0400
X-MC-Unique: 94Nio12ROK2_QDAqpaAWPw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3289615E6;
 Wed,  5 Jul 2023 20:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4630C433C7;
 Wed,  5 Jul 2023 20:18:13 +0000 (UTC)
Date: Wed, 5 Jul 2023 13:18:12 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Message-ID: <20230705201812.GB866@sol.localdomain>
References: <20230705164009.58351-1-giovanni.cabiddu@intel.com>
 <20230705164009.58351-3-giovanni.cabiddu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20230705164009.58351-3-giovanni.cabiddu@intel.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH 2/3] crypto: api - adjust meaning of
 CRYPTO_ALG_ALLOCATES_MEMORY
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
Cc: Fiona Trahe <fiona.trahe@intel.com>, herbert@gondor.apana.org.au,
 horia.geanta@nxp.com, pankaj.gupta@nxp.com, gaurav.jain@nxp.com,
 heinzm@redhat.com, snitzer@kernel.org, linux-kernel@vger.kernel.org,
 qat-linux@intel.com, iuliana.prodan@nxp.com, dm-devel@redhat.com,
 meenakshi.aggarwal@nxp.com, linux-crypto@vger.kernel.org, davem@davemloft.net,
 agk@redhat.com, V.Sethi@nxp.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 05, 2023 at 05:40:08PM +0100, Giovanni Cabiddu wrote:

> Algorithms that do not set this flag will guarantee

"will guarantee" => "guarantee"
 
> that memory is not allocated during request processing, except in
> the avoidable exception cases described below.

"avoidable exception cases" => "exception cases"

Whether they are avoidable depends on the user.

> * Users can request an algorithm with this flag unset if they can't handle
> * memory allocation failures or sleeping during request processing.

Why add the "sleeping during request processing" part?  Isn't that controlled on
a per-request basis by CRYPTO_TFM_REQ_MAY_SLEEP which is a separate thing?

> * They should also follow the constraints below.

"should" => "must"

> + *	- The input and output scatterlists must have no more than 4 entries.
> + *	  If the scatterlists contain more than 4 entries, the algorithm may
> + *	  allocate memory.

"If the scatterlists contains" => "If either scatterlist contains"

Otherwise it is unclear whether this is talking about the length of each
scatterlist individually, or the sum of their lengths.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

