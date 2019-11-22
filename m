Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C173D108AF2
	for <lists+dm-devel@lfdr.de>; Mon, 25 Nov 2019 10:32:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574674377;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+tKzkqIP6QSs/H3L6N5UvKlHEoNEgadH5+qH7jQVwoQ=;
	b=MQgpySZ9SO7IVf+3ZpZZHWmEcqqu0FDBmrx0vZP0/cVb7SpYajGIuK4cUXGKtcCU6j2i1f
	SBsdEMP+L9Uo3cQ9r8TiyGxr0eCYghNo9YA2gythzYr/eiJxVtpDi56krvn3sdOJpZNSlv
	+0NHuSShTa/yMjU3gKRF8Gr73IoaSN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-37yVvecDPw-UL9l5vY2Wxw-1; Mon, 25 Nov 2019 04:32:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35FDA1005509;
	Mon, 25 Nov 2019 09:32:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0604760C63;
	Mon, 25 Nov 2019 09:32:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BB774E562;
	Mon, 25 Nov 2019 09:32:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAMG1MlU021908 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 11:01:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F21A10166F9; Fri, 22 Nov 2019 16:01:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09AA010166FB
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 16:01:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E5E0800295
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 16:01:20 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-16-M9_14UiEO8Ox63axiKMTBw-1; Fri, 22 Nov 2019 11:01:18 -0500
Received: by mail-qt1-f193.google.com with SMTP id r20so8291077qtp.13
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 08:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=CdX7ZQEUe/cRH9WC2wubBDri/lMHrSGbYedbb2yw4Hc=;
	b=h7tUVm9oBU9Q5GT0pJb69piFdzkfyaUMaQ5PBhDZ8bk8WXuWWZ7tpuVGhpmb+zecP3
	XMZ0/uRMUz3Wu4k9h4TbgjkafecVg87H5m5B8qn6OrhC0+ILWZ9wsEw+ORo8sQ5kgl2D
	zf7T9+CrC4ADhwieJO3ajExwax2ukt3m8yuUNvXl92Fg6Xn5aWJxZoFYTY9PiUpN1I7K
	fgA9Gi2WXDIGUm24elSMyvrdbW/pth1Dyb4c35mu4TszbvfZ5Db0cRWMR6bLH4k3z1/o
	syTP7bkh2JfVg9SmXj/hilEfarI6eML3gY39soCgzRpIoeQLBaLywa6kpyVaB9oS6XYl
	9EnA==
X-Gm-Message-State: APjAAAUXDrY5zYw8VOzW3pLlJi1G54AXDAQIPSZ0WWiRYUAulpFV8fva
	WIPk2X3gnR37X5AlYayQNo0=
X-Google-Smtp-Source: APXvYqxWtITWMvEHpWI203D+raKApDrbUfvSAVn8EvwssACZseFHVbt5V5RSqvf9csq4q2LiWohHOQ==
X-Received: by 2002:ac8:1415:: with SMTP id k21mr4959630qtj.80.1574438477243; 
	Fri, 22 Nov 2019 08:01:17 -0800 (PST)
Received: from [192.168.1.164] (pool-108-20-37-130.bstnma.fios.verizon.net.
	[108.20.37.130]) by smtp.gmail.com with ESMTPSA id
	m27sm2196315qta.21.2019.11.22.08.01.14
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 22 Nov 2019 08:01:15 -0800 (PST)
From: Ric Wheeler <ricwheeler@gmail.com>
To: Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux-block@vger.kernel.org
Message-ID: <727e2a7a-eab7-9ba7-e1b8-d75eb853245a@gmail.com>
Date: Fri, 22 Nov 2019 11:01:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.0
MIME-Version: 1.0
Content-Language: en-US
X-MC-Unique: M9_14UiEO8Ox63axiKMTBw-1
X-MC-Unique: 37yVvecDPw-UL9l5vY2Wxw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 25 Nov 2019 04:27:13 -0500
Cc: Vault '20 Program Co-Chairs <vault20chairs@usenix.org>
Subject: [dm-devel] USENIX Vault - open source storage call for talks - CFP
 deadline extended
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Hi all,

We decided to push the CFP deadline for USENIX Vault back until Dec 3rd given 
the holiday and some slowness we had in opening the CFP site. We already have a 
good set of submissions, so please do submit any talk ideas as soon as possible.

See here for more information on how to submit your talk proposals:

https://www.usenix.org/conference/vault20

Hope to see you all there!



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

