Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C15691C3B
	for <lists+dm-devel@lfdr.de>; Fri, 10 Feb 2023 11:04:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676023473;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=olhCJmtpGoZtwd3Ai8A0kYbKcm3uxclhqP/uABtS9YA=;
	b=IT6L79uW/ghqMxmAF7EO85Tj00JEitJqHT2ovogbdlW6sA5Xk6gCtyJWddVl/VLNCBuySK
	YOUPHKE1FWknSmWniUmJAQNiU/Kmp+a5JTs3OE/BtmpvVmxcxgqxMM3pM6JV7uLaotu7w6
	Aoo392wBVZNr/acbFFwCrOkBM/ucq3Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-FDHkOKnaOO6wuqUOVR_BAw-1; Fri, 10 Feb 2023 05:04:32 -0500
X-MC-Unique: FDHkOKnaOO6wuqUOVR_BAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4860418E5346;
	Fri, 10 Feb 2023 10:04:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFB87400DEF3;
	Fri, 10 Feb 2023 10:04:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C224919465A8;
	Fri, 10 Feb 2023 10:04:23 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 505D5194658F
 for <dm-devel@listman.corp.redhat.com>; Fri, 10 Feb 2023 10:04:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 420581415113; Fri, 10 Feb 2023 10:04:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A593140EBF4
 for <dm-devel@redhat.com>; Fri, 10 Feb 2023 10:04:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1626D3810B25
 for <dm-devel@redhat.com>; Fri, 10 Feb 2023 10:04:22 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-137-Qp5yEwpoPuSRsfIqxGajXA-1; Fri, 10 Feb 2023 05:04:19 -0500
X-MC-Unique: Qp5yEwpoPuSRsfIqxGajXA-1
Received: by mail-ed1-f70.google.com with SMTP id
 bq13-20020a056402214d00b004a25d8d7593so3228192edb.0
 for <dm-devel@redhat.com>; Fri, 10 Feb 2023 02:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:content-language
 :references:cc:to:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x4JlGD6rowrRXgkpfULkO1XOq5KoPDOPxu6KrtM17aA=;
 b=eFudQk8JUk4Xlae7ntj0dKkpXrfj23XNh870jPKUXKV/ydSC9YyfDYlqPjBuWU7XY4
 l2aAOjtC4sIn9pwOawwgJwG6DbIpgS9wca1ui8lFb1BqKA/uaBrOxNfJLvMoMfIxc8M2
 3q5pe83rbePd0s+Xo95x2uOYC43dJjibFYW6dwrB+Xzh+v6M09gsbEx4fXnplJCAGoG6
 iEo2Q97LC73hlkxrn+dL3473Ke2j2XjauyY9CkZdVuTRAWSPZOidNX89nMHJi1bs8QQM
 JT50icOuIyOXPu1Z141Ro1eMYzN7WvuMCReC8atyMuLHEpx3k12LM2Aa906vBmRBc+LN
 xp2g==
X-Gm-Message-State: AO0yUKUQp8h+Dxrgs5MagZldMptbUy59NdxeuYnt1AuAZFIa5fapcrtk
 NZfjkyrZGghjCkjTrrXaqginvQPOXmyBibckAeAGUXbfVpqPM54qEoVEGQ8D6zvOGtM2nhYLYsG
 UYdZBtZjiuQ3LI1c=
X-Received: by 2002:a17:907:1c83:b0:884:c45f:1c04 with SMTP id
 nb3-20020a1709071c8300b00884c45f1c04mr21291163ejc.2.1676023458784; 
 Fri, 10 Feb 2023 02:04:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/XiYCRiYc5gOEzbtlp8b2QpFLwqmyTN0+JkQA3DI+6cy2V0LK3pJf7W3BoUUAyB5nraFRSIg==
X-Received: by 2002:a17:907:1c83:b0:884:c45f:1c04 with SMTP id
 nb3-20020a1709071c8300b00884c45f1c04mr21291143ejc.2.1676023458597; 
 Fri, 10 Feb 2023 02:04:18 -0800 (PST)
Received: from [192.168.0.5] ([85.13.73.241]) by smtp.gmail.com with ESMTPSA id
 s20-20020a170906061400b0088ba2de323csm2146631ejb.181.2023.02.10.02.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 02:04:18 -0800 (PST)
Message-ID: <0068e540-0429-232a-d820-b582d36f903d@redhat.com>
Date: Fri, 10 Feb 2023 11:04:16 +0100
MIME-Version: 1.0
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer
 <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>,
 Steve Baker <sbaker@redhat.com>
References: <alpine.LRH.2.21.2302090948560.7238@file01.intranet.prod.int.rdu2.redhat.com>
From: Peter Rajnoha <prajnoha@redhat.com>
In-Reply-To: <alpine.LRH.2.21.2302090948560.7238@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [dm-devel] [PATCH v2] dm: send just one event on resize, not two
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
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-MW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/9/23 16:11, Mikulas Patocka wrote:
> Hi
> 
> I discussed this uevent thing with Zdenek and we concluded that it is 
> sufficient to send just one uevent on resize, not two.
> 
> So, I made a second patch that fixes the uevent-while-suspended bug. It 
> replaces set_capacity_and_notify with set_capacity (so that no uevent is 
> set at this point) and it detects capacity change in do_resume - and if 
> the capacity was changed, it adds "RESIZE=1" to an uevent that is being 
> sent.
> 
> Zdenek and Peter, please test it.
> 

OK, I've tested this and this works correctly as expected. If we could
go with this patch, that would much better than having 2 independent
uevents. With just one uevent we don't need any special treatment in
udev rules for the extra "RESIZE=1" uevent and also we don't need to
process all the udev rules twice uselessly when those 2 uevents
(RESIZE="1" and "DM RESUME") always go together anyway.

Thanks!

-- 
Peter

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

