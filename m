Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F96079898F
	for <lists+dm-devel@lfdr.de>; Fri,  8 Sep 2023 17:06:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694185603;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LN7aAQ1AJW4azo/8vjN4r3V5MJ4HwBxlba1jPHp09Ug=;
	b=MJY7AMiWM7deGsDU+vRHjBHm5ST+FqeFFCA8EXPFBjaLuAtlnPH6HdAVruslnjgXicsG0E
	fH3xCt1UVIRtnnFwYC+pjdCbG8PpNxm6/9/O/kGpeduvQXkskckm9s3Tr50ofY60dDuIwz
	roIu7vFRHWc42H3tgHJtj/ZNarZIAbQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-dsaM8TSFPZmO4JMpCMfUoA-1; Fri, 08 Sep 2023 11:06:36 -0400
X-MC-Unique: dsaM8TSFPZmO4JMpCMfUoA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70DE694EA41;
	Fri,  8 Sep 2023 15:06:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75C3C47FC73;
	Fri,  8 Sep 2023 15:06:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C2FB81946A67;
	Fri,  8 Sep 2023 15:06:25 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 44DE0194658C
 for <dm-devel@listman.corp.redhat.com>; Fri,  8 Sep 2023 12:34:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 26537412F2CF; Fri,  8 Sep 2023 12:34:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F83A40ED780
 for <dm-devel@redhat.com>; Fri,  8 Sep 2023 12:34:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00ADB8115B5
 for <dm-devel@redhat.com>; Fri,  8 Sep 2023 12:34:36 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-S5ntkKjoMUu589YhW1GdGA-1; Fri,
 08 Sep 2023 08:34:34 -0400
X-MC-Unique: S5ntkKjoMUu589YhW1GdGA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DB865CE1A82;
 Fri,  8 Sep 2023 12:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37F9C433C9;
 Fri,  8 Sep 2023 12:34:25 +0000 (UTC)
Date: Fri, 8 Sep 2023 14:34:22 +0200
From: Christian Brauner <brauner@kernel.org>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <20230908-planung-raumakustik-abf518a2f88a@brauner>
References: <818a3cc0-c17b-22c0-4413-252dfb579cca@redhat.com>
 <20230907094457.vcvmixi23dk3pzqe@quack3>
 <20230907-abgrenzen-achtung-b17e9a1ad136@brauner>
 <513f337e-d254-2454-6197-82df564ed5fc@redhat.com>
 <20230908073244.wyriwwxahd3im2rw@quack3>
 <86235d7a-a7ea-49da-968e-c5810cbf4a7b@redhat.com>
 <20230908102014.xgtcf5wth2l2cwup@quack3>
 <15c62097-d58f-4e66-bdf5-e0edb1306b2f@redhat.com>
 <20230908-bergwacht-bannen-1855c8afe518@brauner>
 <4a0952f8-32b1-46fc-a9f2-4be58ee41ace@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4a0952f8-32b1-46fc-a9f2-4be58ee41ace@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Fri, 08 Sep 2023 15:06:24 +0000
Subject: Re: [dm-devel] [PATCH] fix writing to the filesystem after unmount
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
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, dm-devel@redhat.com,
 Mikulas Patocka <mpatocka@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Zdenek Kabelac <zkabelac@redhat.com>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> So can you please elaborate which new risks are we going to introduce by
> fixing this resource hole ?

I'm not quite sure why you need a personal summary of the various
reasons different people brought together in the thread.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

