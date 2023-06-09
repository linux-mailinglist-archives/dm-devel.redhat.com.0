Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB5B72A2AC
	for <lists+dm-devel@lfdr.de>; Fri,  9 Jun 2023 20:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686337010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cxm+uSupPcnOQVjN37bL9FrWuxKW20wCjWjRUWshPVQ=;
	b=MY+usMbL8oez+62wtGS5oJvBGSf5/vYPMuuAuQxXBOQOCeI2g3m8MIC1kHHjxIaYhM7i7h
	TVFbPEhEs0JxUL91hL82uBLwXvvEPhpkx21YQs+uzxIPhVQXMLK5rMlFxlCoqwShES5w5h
	air1x2ohvFDVbuiFnelaUSZuw0Xf3Zs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-L6p5Nw8APteICvu9cT6PGA-1; Fri, 09 Jun 2023 14:56:48 -0400
X-MC-Unique: L6p5Nw8APteICvu9cT6PGA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31E903C13505;
	Fri,  9 Jun 2023 18:56:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DB22492B00;
	Fri,  9 Jun 2023 18:56:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EC5F819451CA;
	Fri,  9 Jun 2023 18:56:39 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2CD94194658C
 for <dm-devel@listman.corp.redhat.com>; Fri,  9 Jun 2023 18:56:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E34A310BDF; Fri,  9 Jun 2023 18:56:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D18E810ED7;
 Fri,  9 Jun 2023 18:56:37 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id C04E930C0502; Fri,  9 Jun 2023 18:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 BE97D3F7CF; Fri,  9 Jun 2023 20:56:37 +0200 (CEST)
Date: Fri, 9 Jun 2023 20:56:37 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20230602011355.GA16848@frogsfrogsfrogs>
Message-ID: <7bf96e58-7151-a63d-317f-1ddedd4927ad@redhat.com>
References: <alpine.LRH.2.21.2305260915400.12513@file01.intranet.prod.int.rdu2.redhat.com>
 <20230602011355.GA16848@frogsfrogsfrogs>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [dm-devel] fuzzing bcachefs with dm-flakey
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
Cc: linux-fsdevel@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 dm-devel@redhat.com, Kent Overstreet <kent.overstreet@linux.dev>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 1 Jun 2023, Darrick J. Wong wrote:

> On Mon, May 29, 2023 at 04:59:40PM -0400, Mikulas Patocka wrote:
>
> > #!/bin/sh -ex
> > umount /mnt/test || true
> > dmsetup remove_all || true
> > rmmod brd || true
> > SRC=/usr/src/git/bcachefs-tools
> > while true; do
> >         modprobe brd rd_size=1048576
> >         bcachefs format --replicas=2 /dev/ram0 /dev/ram1
> >         dmsetup create flakey --table "0 `blockdev --getsize /dev/ram0` linear /dev/ram0 0"
> >         mount -t bcachefs /dev/mapper/flakey:/dev/ram1 /mnt/test
> >         dmsetup load flakey --table "0 `blockdev --getsize /dev/ram0` flakey /dev/ram0 0 0 1 4 random_write_corrupt 100000000 random_read_corrupt 100000000"
> 
> Hey, that's really neat!
> 
> Any chance you'd be willing to get the dm-flakey changes merged into
> upstream so that someone can write a recoveryloop fstest to test all the
> filesystems systematically?
> 
> :D
> 
> --D

Yes, we will merge improved dm-flakey in the next merge window.

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

