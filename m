Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5D91A1DC09D
	for <lists+dm-devel@lfdr.de>; Wed, 20 May 2020 22:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590008035;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zNiGVHRV33bePJCCD9LlZdhMHP2H9p3NIf6nFBpHbDw=;
	b=H0+NAjkYSGgrjIgVV8tgQwd8WL9dUEeGtfTQLwE/DHOyb/oatZgK3z65PuF6wq2PoznS2L
	QIMNhcP1D/aeNifZ5QRZJGJDOgRLZpQ3QStxHvR6duiVx3u02vGiUe7wXl219Pep+SKvr3
	Dbu5KsmTeKkruy38MXp1fZxFuDgmFHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-j7_CtCorPLKjppXLQQZLgA-1; Wed, 20 May 2020 16:53:53 -0400
X-MC-Unique: j7_CtCorPLKjppXLQQZLgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20E981005510;
	Wed, 20 May 2020 20:53:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3762260BEC;
	Wed, 20 May 2020 20:53:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C67244EDB9;
	Wed, 20 May 2020 20:53:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KKrabg000727 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 16:53:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17E1810CD91C; Wed, 20 May 2020 20:53:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 131B910CD92A
	for <dm-devel@redhat.com>; Wed, 20 May 2020 20:53:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31F771049842
	for <dm-devel@redhat.com>; Wed, 20 May 2020 20:53:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-AXk7YRjLOtWtKXXcjSm-Kg-1; Wed, 20 May 2020 16:53:26 -0400
X-MC-Unique: AXk7YRjLOtWtKXXcjSm-Kg-1
Received: by mail-wm1-f51.google.com with SMTP id n18so4288207wmj.5;
	Wed, 20 May 2020 13:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OVV6rToPt6DUuHhyLVlpDjJnieED/Qi2lLESWSJ5lx0=;
	b=VurFk26TZi166VErtSKYWgJb7ZWaPDndqKU8iYCoEBn/Fh0vJmkUapUdLa/fYg0Xbk
	1/hVQpmGCGe+gQJzVg6ff3+VDIg1zWKHFNqqfJNO5zpwBwf72LjCEvMHxvvq4MQGg4rW
	Rg1u1bD9Mj0qSL4v8lWn+K5YIfwPa3enMXHnxm3GeMhwA+xOLdK/8ENUC4Um4UFY+hUo
	coq03G5/xkFG0al2KLlnx8d6VqBHw1237ueHnWH968iIVV0qqcbswTwzNLE2eNHMR3iL
	4cxZzerxuO4mx5q09gVEho/OnnXf468htta/+8PIMyjAdWrw84IquMzaeEbUrovZSi7B
	Cc3g==
X-Gm-Message-State: AOAM531Y75U8ZmYa8vInIdIG4cqG3dKVrb+0puNeKUbPTOw22+jrOIUa
	kCP0ryU3eKJumsjv6KlZixdlHWU=
X-Google-Smtp-Source: ABdhPJz18pzxoXMaES0aTOFkSv8RXUZi3vHx1L4cUQhNfoEa1KsALkb5Q8WpJsbxzIvmw9ugm6uDCQ==
X-Received: by 2002:a05:600c:2109:: with SMTP id
	u9mr5885860wml.75.1590008005342; 
	Wed, 20 May 2020 13:53:25 -0700 (PDT)
Received: from localhost (105.red-81-43-178.staticip.rima-tde.net.
	[81.43.178.105])
	by smtp.gmail.com with ESMTPSA id m1sm4308205wrx.44.2020.05.20.13.53.24
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 20 May 2020 13:53:24 -0700 (PDT)
To: Martin Wilck <martin.wilck@suse.com>
References: <fbbd16f6-3564-288e-4180-6322a2b478da@gmail.com>
	<97355996ab3dfeda13cee42a93f92f3ab54d289a.camel@suse.com>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <3fe397f0-b9d9-bc8a-93ce-b8cd593729df@gmail.com>
Date: Wed, 20 May 2020 22:53:23 +0200
MIME-Version: 1.0
In-Reply-To: <97355996ab3dfeda13cee42a93f92f3ab54d289a.camel@suse.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Christian Hesse <mail@eworm.de>,
	dm-devel mailing list <dm-devel@redhat.com>
Subject: Re: [dm-devel] multipath-tools: -1patch in upstream-queue
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 5/20/20 10:36 PM, Martin Wilck wrote:

> However, it has no "Reviewed-by:" tag from anyone, including yourself,
> so it couldn't be pushed to upstream-queue yet.

Trivial enough. And a similar one was included, at least, in Fedora, Alpine and Gentoo.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

