Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F9763D3F0
	for <lists+dm-devel@lfdr.de>; Wed, 30 Nov 2022 12:06:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669806411;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4VWDUAjdyamMgsuRcmZBwLntdBRPSQsZxbCleNh/qKc=;
	b=LMAROb6GePKlpYGxfjxoQ+bMRGRKkLruItT0o799JMoIVxyLvDO7OqEzE84ZW2jnC2tSr6
	nn9owfMcnu1qPhQvoobEk9cIqd1H3fYaX50z7Nbk/7im9ConSSfD5L64GGOSDTh9MynWG/
	o+gGf3JoLy7DVKDkrrMO4KRPC7JT1Os=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-PA9E9PhuM-WASnBiW228Yg-1; Wed, 30 Nov 2022 06:06:47 -0500
X-MC-Unique: PA9E9PhuM-WASnBiW228Yg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60281800186;
	Wed, 30 Nov 2022 11:06:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66FF01415119;
	Wed, 30 Nov 2022 11:06:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 82B6D19465B6;
	Wed, 30 Nov 2022 11:06:30 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2D79719465A0
 for <dm-devel@listman.corp.redhat.com>; Wed, 30 Nov 2022 11:06:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12D1D200B404; Wed, 30 Nov 2022 11:06:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BB3D2027064
 for <dm-devel@redhat.com>; Wed, 30 Nov 2022 11:06:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3FF485A588
 for <dm-devel@redhat.com>; Wed, 30 Nov 2022 11:06:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-pkGOxUI6MkS5Vartx2FCgA-1; Wed, 30 Nov 2022 06:06:20 -0500
X-MC-Unique: pkGOxUI6MkS5Vartx2FCgA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CFE661B2D;
 Wed, 30 Nov 2022 11:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DF5C433D6;
 Wed, 30 Nov 2022 11:06:18 +0000 (UTC)
Date: Wed, 30 Nov 2022 06:06:17 -0500
From: Sasha Levin <sashal@kernel.org>
To: Keith Busch <kbusch@kernel.org>
Message-ID: <Y4c5KSErgaBY/cwW@sashalap>
References: <20221123124234.265396-1-sashal@kernel.org>
 <20221123124234.265396-25-sashal@kernel.org>
 <Y342hZgFQdLfTfdx@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
In-Reply-To: <Y342hZgFQdLfTfdx@kbusch-mbp.dhcp.thefacebook.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH AUTOSEL 5.15 25/31] dm-log-writes: set
 dma_alignment limit in io_hints
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, dm-devel@redhat.com,
 agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On Wed, Nov 23, 2022 at 08:04:37AM -0700, Keith Busch wrote:
>On Wed, Nov 23, 2022 at 07:42:26AM -0500, Sasha Levin wrote:
>> From: Keith Busch <kbusch@kernel.org>
>>
>> [ Upstream commit 50a893359cd2643ee1afc96eedc9e7084cab49fa ]
>>
>> This device mapper needs bio vectors to be sized and memory aligned to
>> the logical block size. Set the minimum required queue limit
>> accordingly.
>
>Probably harmless, but these dm dma_alignment patches are not needed
>prior to 6.0.

I'll drop them on all <6.0 kernels, thanks!

-- 
Thanks,
Sasha

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

