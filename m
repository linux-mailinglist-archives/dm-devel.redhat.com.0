Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B91D8721D5D
	for <lists+dm-devel@lfdr.de>; Mon,  5 Jun 2023 07:09:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685941784;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tXYDkF0E5oRcU+lfIHZxMNXOF9eySimfiy5RXLaVm1I=;
	b=Ms6o7KQc/9NItprJBUiWjdcev3QYXygRz3Fk2ndaY1KlVJX0CUHTdJaiLxDfpiTmAjOoL5
	ZaKRSMLuZ+EuPAcjCcOdEOb1954vNfdNEomH/rn3b5sdKotsxZubMAUeEwY+lW0crVhuc4
	vUf/3ovZAHx2Ld/Ajksnch2KYusZlI8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-G0_EZN09NjmiuLrAKqhH7Q-1; Mon, 05 Jun 2023 01:09:40 -0400
X-MC-Unique: G0_EZN09NjmiuLrAKqhH7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D31F8038E8;
	Mon,  5 Jun 2023 05:09:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75C9C9E75;
	Mon,  5 Jun 2023 05:09:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1A89D19465A0;
	Mon,  5 Jun 2023 05:09:37 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A5D1A19465A8
 for <dm-devel@listman.corp.redhat.com>; Mon,  5 Jun 2023 05:09:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 871299E8B; Mon,  5 Jun 2023 05:09:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F3967AE4
 for <dm-devel@redhat.com>; Mon,  5 Jun 2023 05:09:19 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB51980120A
 for <dm-devel@redhat.com>; Mon,  5 Jun 2023 05:09:19 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-VCG54_NhP5C8jwfO5Z0NNg-1; Mon, 05 Jun 2023 01:09:16 -0400
X-MC-Unique: VCG54_NhP5C8jwfO5Z0NNg-1
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6532671ccc7so3187499b3a.2; 
 Sun, 04 Jun 2023 22:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685941755; x=1688533755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CE05+ZYwK+jxvTU8Tsht4WD3cttPshg/rzrFK6OOD1c=;
 b=AeSqnVhgs1SvmKVUfGakwh/k1pmRqZBVrkt1dHZZLnnzqa6YSkcQKnieCaVUYYFIAl
 KA51aYN/PcYPGjRTNcY5Z1Xa9538a0hGRfQNmtsgqNeL1TMNzNeLueLDopoemJwMXLfT
 hL25vUTWJ+HF9OHhRBOS2m3tQz7ojmSlRHxP8lK4W2ASlqyjUGgpVee8orx0VeaNhvVR
 29VuPazA6z66FgUIzUEiksXsn8K5LRQmT4eCuBW3YAHpYZ99oyvaej7Lm/+m0j1spNMk
 +Fi6XGnGixTn661XtjnGtxhi0+CTL8XcpYzH52RBK6Kb2mKGjSVtW/lrq1i9ioGoscZV
 D2Qw==
X-Gm-Message-State: AC+VfDwYMF6WTJ5nQZ6C3a3GDvdNvgSoYDibkmAaxjEuoMZERsQ8LnlN
 CAgQbvcCIObC7GzBj+GaraAiw5pGL9cXRA==
X-Google-Smtp-Source: ACHHUZ5+SMTfjAGKE+4mbXrA8IbU4nehsPlQWkIoyZb5r9krNScNgKNpIle4Wdp9T9DZ17VzeAmHHw==
X-Received: by 2002:a05:6a00:2e11:b0:64b:256:204c with SMTP id
 fc17-20020a056a002e1100b0064b0256204cmr23937293pfb.20.1685941754571; 
 Sun, 04 Jun 2023 22:09:14 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
 by smtp.gmail.com with ESMTPSA id
 fe16-20020a056a002f1000b0064d48d98260sm4329175pfb.156.2023.06.04.22.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 22:09:14 -0700 (PDT)
From: Russell Harmon <eatnumber1@gmail.com>
To: bagasdotme@gmail.com
Date: Sun,  4 Jun 2023 22:08:49 -0700
Message-Id: <20230605050853.6240-1-eatnumber1@gmail.com>
In-Reply-To: <20230604190604.4800-1-eatnumber1@gmail.com>
References: <20230604190604.4800-1-eatnumber1@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [dm-devel] [PATCH v4 0/4] Improve the dm-integrity documentation.
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
Cc: Russell Harmon <eatnumber1@gmail.com>, dm-devel@redhat.com,
 mpatocka@redhat.com, snitzer@redhat.com, linux-doc@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Russell Harmon (4):
  Documentation: dm-integrity: Fix minor grammatical error.
  Documentation: dm-integrity: Document the meaning of "buffer".
  Documentation: dm-integrity: Document default values.
  Documentation: dm-integrity: Document an example of how the tunables
    relate.

 .../device-mapper/dm-integrity.rst            | 43 ++++++++++++-------
 1 file changed, 27 insertions(+), 16 deletions(-)

-- 
2.34.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

