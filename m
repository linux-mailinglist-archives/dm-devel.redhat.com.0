Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6980D4FE3C8
	for <lists+dm-devel@lfdr.de>; Tue, 12 Apr 2022 16:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649773760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hjCCP6GcQqsp01mFZxjTQBdFDW2Y4U4MxoLblB4H9uI=;
	b=a/wKdb2VG5fBl2lVUqV3/tyZlKD+5+slRITNirfV3OuhBSgLTxubXj78VXOcRS5FHRKTp7
	w8njoMLoAre64lgwTsbSSZfSHaq7p4lpZrq5/smDLyK1bXe9zl+Rt+hYwPwAKOKu6NT1SQ
	orxPvhyw3Yjoj12xbcPipR4waMnL6PQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-clzeA2GKOtOCQQXl6zIC8g-1; Tue, 12 Apr 2022 10:29:18 -0400
X-MC-Unique: clzeA2GKOtOCQQXl6zIC8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 265CC29AB3EE;
	Tue, 12 Apr 2022 14:29:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01688145BA58;
	Tue, 12 Apr 2022 14:29:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C53A194037E;
	Tue, 12 Apr 2022 14:29:08 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 540941940365
 for <dm-devel@listman.corp.redhat.com>; Tue, 12 Apr 2022 14:29:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 47D9A145BA58; Tue, 12 Apr 2022 14:29:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05B38145BA54;
 Tue, 12 Apr 2022 14:29:06 +0000 (UTC)
Date: Tue, 12 Apr 2022 09:29:05 -0500
From: David Teigland <teigland@redhat.com>
To: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <20220412142905.GA26912@redhat.com>
References: <YlNUhtXltj8vgvcZ@itl-email>
 <e65dbacc-f241-22ba-62a9-a6f522cce9dc@redhat.com>
 <YlRjvp7SH3To0pHe@itl-email>
 <cc43900d-35a3-14ae-73ef-919ab02e01ff@redhat.com>
 <YlSsMlcE5x2B58hc@itl-email>
 <6a6c09ad-73c9-2450-f1fb-0e3e4ba438e6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6a6c09ad-73c9-2450-f1fb-0e3e4ba438e6@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [dm-devel] Potential enhancements to dm-thin v2
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
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Joe Thornber <ejt@redhat.com>, dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dne 11. 04. 22 v 0:03 Demi Marie Obenour napsal(a):
> For quite a while, I have wanted to write a tool to manage thin volumes  =
    =20
> that is not based on LVM.=20

On Tue, Apr 12, 2022 at 11:32:09AM +0200, Zdenek Kabelac wrote:
> Here is actually the fundamental problem with your proposal - our design =
was
> about careful split between user-space and kernel 'who is the owner/holde=
r
> of information'=A0 - your proposal unfortunately does not fit the model w=
here
> lvm2 is the authoritative owner of info about devices

The proposal is a new tool to manage dm-thin devices, not to rewrite lvm.
I would hope the tool is nothing at all like lvm, but rather "thinsetup"
in the tradition of dmsetup, cryptsetup.  I think it's a great idea and
have wanted such a tool for years.  I have a feeling that many have
already written ad hoc thinsetup-like tools, and there would be fairly
broad interest in it (especially if it has a proper lib api.)

Dave
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

