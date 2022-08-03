Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEDE589426
	for <lists+dm-devel@lfdr.de>; Wed,  3 Aug 2022 23:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659563424;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FKJWZFFQMrfN9f8Jcyy7hdIfiM2jsUpC/H3yVNHtwCE=;
	b=iDs2DhTWdMFCjpj0Tw9JaKVXtGR4ksR/xum21ydZOBHSIQ7lJOehgXqZ2EfbQV6Knxaf1Q
	ydoeOSHb/M66PimK1aeT3qmZnrCVbZEqu1Kph5+vuZnfJHmiDSax2Z4p1a1Wpmsa+37qyI
	Jswkbhq1/wpcR3JNFpKFsUWwI88uFZc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-K3ZYf0_cMMmj4wCNZ92MKw-1; Wed, 03 Aug 2022 17:50:23 -0400
X-MC-Unique: K3ZYf0_cMMmj4wCNZ92MKw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 082EC280F2B0;
	Wed,  3 Aug 2022 21:50:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B6AE492C3B;
	Wed,  3 Aug 2022 21:50:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1D30C1946A62;
	Wed,  3 Aug 2022 21:50:15 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 388481946A4E
 for <dm-devel@listman.corp.redhat.com>; Wed,  3 Aug 2022 21:50:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1D41C2166B2A; Wed,  3 Aug 2022 21:50:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1995B2166B26
 for <dm-devel@redhat.com>; Wed,  3 Aug 2022 21:50:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3019280F2AD
 for <dm-devel@redhat.com>; Wed,  3 Aug 2022 21:50:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-qOMl68hvNC-7UHqgkg-hMA-1; Wed, 03 Aug 2022 17:50:11 -0400
X-MC-Unique: qOMl68hvNC-7UHqgkg-hMA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35C10615C2;
 Wed,  3 Aug 2022 21:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D1AC433C1;
 Wed,  3 Aug 2022 21:50:09 +0000 (UTC)
Date: Wed, 3 Aug 2022 21:49:50 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Daniil Lunev <dlunev@chromium.org>
Message-ID: <YurtfvdeYh0kLd+8@gmail.com>
References: <YtB45Lte5UhlEE6y@redhat.com>
 <CAONX=-dEG121RQ6L-4fPMXrLXb3JeYNVNiPzHXNaRLbwRzb3bw@mail.gmail.com>
 <alpine.LRH.2.02.2207150528170.5197@file01.intranet.prod.int.rdu2.redhat.com>
 <cca5b463-a860-de8d-b7e4-a8d30aef2ff2@gmail.com>
 <CAONX=-fJHgfGkwR5A1MT+8FHckueehOsUS_LyHkjrgp4Y+vOgw@mail.gmail.com>
 <CAONX=-ft=ewFDui4jmd2fvcNr2EJc90=ZNOueDdp6HaPZmvObQ@mail.gmail.com>
 <Yun4LH+StcuBXRtO@sol.localdomain>
 <CAONX=-esLr5bGUks_a8wQBky37NnCawh2eOMemYg32HcPA7pmA@mail.gmail.com>
 <Yuq9jhxb+WgO55KJ@gmail.com>
 <CAONX=-dCrJabyvt2S24kEJi38Pbuzj_4kvugoF_75PWV69bNJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAONX=-dCrJabyvt2S24kEJi38Pbuzj_4kvugoF_75PWV69bNJw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH 1/1] dm: add message command to disallow
 device open
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
Cc: Brian Geffon <bgeffon@google.com>, Mike Snitzer <snitzer@kernel.org>,
 linux-kernel@vger.kernel.org, Zdenek Kabelac <zdenek.kabelac@gmail.com>,
 dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 04, 2022 at 06:44:53AM +1000, Daniil Lunev wrote:
> > Have you also considered unlinking the device node (/dev/dm-$idx) from the
> > filesystem after it has been set up for swap?
> Yes, the node can be re-linked with mknod, thus is not a suitable solution.

I thought you were trying to defend against path traversal attacks, not
arbitrary code execution?  If your threat model includes arbitrary code
execution by root, you really need to be using SELinux.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

