Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CAC9220AE51
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 10:15:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593159305;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=atcLuM6stiv9WLnWF6z8CnmYKClQg8bt2VP/UzNIoCM=;
	b=O5H8h8Usey9X5Pe1k+Pg5tPvzLxeH37p073ecwT88xfOAZ2TdCHKw2l4VhKkcVRHIy8sZH
	h+5aJfqffUms53lkvS3/qzrB2uTWKeJl6lrg09ICXuzwUw9/bCGcSQ+CTQysC3dro1Spzq
	AQdl2HBHGGCVT3jQ7IP8qJmVNgeJerY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-kv2-hgLAOoaaYJaDWO2yOQ-1; Fri, 26 Jun 2020 04:14:32 -0400
X-MC-Unique: kv2-hgLAOoaaYJaDWO2yOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38F01107ACF3;
	Fri, 26 Jun 2020 08:14:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1604811CC34;
	Fri, 26 Jun 2020 08:14:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CDA31809561;
	Fri, 26 Jun 2020 08:14:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PDFNvG032485 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 09:15:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8AB19201FCFD; Thu, 25 Jun 2020 13:15:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F75F2144B39
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 13:15:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0995A8E69AF
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 13:15:21 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-8-DDT4RxiCPXmUHkMKfwZasw-1; Thu, 25 Jun 2020 09:15:18 -0400
X-MC-Unique: DDT4RxiCPXmUHkMKfwZasw-1
Received: by mail-lf1-f67.google.com with SMTP id d7so3165125lfi.12;
	Thu, 25 Jun 2020 06:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=QR42zeOxTbypLVBEYvN0oGwLT+XNTPkg4CKLs7fOlZw=;
	b=nOC0ZzLMdF4mufr0tUNybBxlfdtdED9dicyUzNdNss+C2wMI0D6sQP1cBNyhqSDrAw
	WMnHtU1rVg4xVvK5WUJalSJNyzUiqpfM9iswZbUj9LTquHPCXDWVrSbv4X2R9PXBdFEv
	GcCej0J6R1PMqfZ6QHXCYWdjnR4jxQ2y2PojjyPbsH9zjZ+m7EJ1McHzlfBRCkQlr8P8
	56UiaDGmxAzyT+zjS97gFVSXyFToTxXP8rb9K27zGSk7vzb9y/kEQK3ZhUTXUV8v6824
	R9K8aDAB+m7LY6DiYJ4g6aDYjbpFRGH9GdWC3+fbV9i0i3vbHUI1EQitYqZ8ktjU0sNo
	3yMw==
X-Gm-Message-State: AOAM533rMYDDl1hLV0KoBXq5YR0OSbCz3efs5mSytHp7y+Dw/MLyiFFy
	iWNYqEDYxKR9Zb7lwYaWHZw=
X-Google-Smtp-Source: ABdhPJwzgnJuL3K2LW4ohUpxzWu37UAp+RFuOi10vfvqKVDHappu8GzNB5BMfab7VBvLBXPKTc6snw==
X-Received: by 2002:ac2:5e29:: with SMTP id o9mr17880697lfg.196.1593090916198; 
	Thu, 25 Jun 2020 06:15:16 -0700 (PDT)
Received: from mail-personal.localdomain ([185.204.1.215])
	by smtp.gmail.com with ESMTPSA id
	t13sm4809148ljg.78.2020.06.25.06.15.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 25 Jun 2020 06:15:15 -0700 (PDT)
Received: by mail-personal.localdomain (Postfix, from userid 1000)
	id A8986611B4; Thu, 25 Jun 2020 16:15:17 +0300 (EEST)
Date: Thu, 25 Jun 2020 16:15:17 +0300
From: Ferdinand Blomqvist <ferdinand.blomqvist@gmail.com>
To: Aiden Leong <aiden.leong@aibsd.com>
Message-ID: <20200625131517.GD1036@mail-personal>
References: <20200625041141.8053-1-aiden.leong@aibsd.com>
	<202006242231.E17DAB2@keescook>
	<5f4008d5-1ddd-443e-9190-a8565746698d.aiden.leong@aibsd.com>
MIME-Version: 1.0
In-Reply-To: <5f4008d5-1ddd-443e-9190-a8565746698d.aiden.leong@aibsd.com>
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Jun 2020 04:13:56 -0400
Cc: Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
	Mike Snitzer <snitzer@redhat.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Anton Vorontsov <anton@enomsg.org>, YueHaibing <yuehaibing@huawei.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	dm-devel <dm-devel@redhat.com>, Colin Cross <ccross@android.com>,
	Thomas Gleixner <tglx@linutronix.de>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [RFC] Reed-Solomon Code: Update no_eras to the
 actual number of errors
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, 

On 2020-06-25 14:46:11, Aiden Leong wrote:
>
>BTW: I do believe these functions should be split into a function family. It's really hard to call them correctly and hard to debug as well.

I don't think the functions should be split up. Most probably it is the
documentation that should be improved :) But, I do agree that it is not
that easy to call the functions correctly.

Best,
Ferdinand

-- 
Ferdinand Blomqvist
ferdinand.blomqvist[at]gmail.com
GPG key: 9EFB 7A2C 0432 4EC5 32BA FA61 CFE9 4164 93E8 B9E4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

