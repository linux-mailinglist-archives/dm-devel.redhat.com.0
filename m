Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AF52327713A
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 14:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600951264;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QxP4qwC/Ho6kbnxA6/Kj/bfg5b5jZ4Tvee/m7ACtolQ=;
	b=ZRJKqutASMzgYZgkNRf9it4GgrDwlL9vNf92ve7+Nlg1/+qvnlkaoUShIijY7xB2sh8887
	3Z1+EoFOegzyhInrr3uVrkDnZDh3U0ioh3zEt43iVWfpuHoNtCrjYQ2ZBAauCwpGlqHWL/
	JmICk8e52nn5s31jfmzGFZcNacmGeI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-jqPjVFMmO0SFMgXWliNE2A-1; Thu, 24 Sep 2020 08:41:02 -0400
X-MC-Unique: jqPjVFMmO0SFMgXWliNE2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62D4F18BA283;
	Thu, 24 Sep 2020 12:40:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 519B560C15;
	Thu, 24 Sep 2020 12:40:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4A06181A2E6;
	Thu, 24 Sep 2020 12:40:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OCeXCP017547 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 08:40:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1FC4E5D9F1; Thu, 24 Sep 2020 12:40:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D52415D9D2;
	Thu, 24 Sep 2020 12:40:26 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 08OCeQOe002336; Thu, 24 Sep 2020 08:40:26 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 08OCePHP002332; Thu, 24 Sep 2020 08:40:25 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 24 Sep 2020 08:40:25 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
In-Reply-To: <3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
Message-ID: <alpine.LRH.2.02.2009240834020.11084@file01.intranet.prod.int.rdu2.redhat.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, ssudhakarp@gmail.com, snitzer@redhat.com,
	dm-crypt@saout.de, dm-devel@redhat.com, Shirley Ma <shirley.ma@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
 lengths for skcipher devices
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 23 Sep 2020, Sudhakar Panneerselvam wrote:

> Could someone review this patch set, please?
> 
> Thanks
> Sudhakar

Hi

I'd like to ask - what sector size do you use in dm-crypt? Could the issue 
be fixed just by using the smallest possible 512-byte sectors?

What I/O method does qemu use? Is it direct i/o + aio? What is unaligned - 
the base address? Or length? Or the sector number? Could you use strace on 
qemu and show an example of an I/O that fails due to alignment?

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

