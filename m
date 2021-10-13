Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDB342D422
	for <lists+dm-devel@lfdr.de>; Thu, 14 Oct 2021 09:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634198020;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rRkCPXkFdJ54y5r38Cd6BwAlfCWbeehayPRjNwfXxzk=;
	b=NoO1nmgTDQDYeJVLb+qxpDoX4Wry+RiWuwtIGrqZlBFhpPVGlPEEkAzFyotD0f9ChMDYHF
	F9mcx22NZx+X83wpokQyfFnekjjyoXrS9vYX5ZNsWpNYgFNp4gg2iF9J+wJlhapmC5wmVO
	kvpkQsRAWDojwxdf0HTVIyPqLZ/GehU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-OU5Cg2gcMRWbawHSF2VWSA-1; Thu, 14 Oct 2021 03:53:36 -0400
X-MC-Unique: OU5Cg2gcMRWbawHSF2VWSA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF36B1018735;
	Thu, 14 Oct 2021 07:53:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7CDB5DA60;
	Thu, 14 Oct 2021 07:53:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E26BD180598A;
	Thu, 14 Oct 2021 07:53:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19DK345M023029 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 Oct 2021 16:03:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D0CDC7086C; Wed, 13 Oct 2021 20:03:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from x2.localnet (unknown [10.22.33.236])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 330135BAFB;
	Wed, 13 Oct 2021 20:02:32 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: corbet@lwn.net, axboe@kernel.dk, agk@redhat.com, snitzer@redhat.com,
	ebiggers@kernel.org, tytso@mit.edu, paul@paul-moore.com,
	eparis@redhat.com, jmorris@namei.org, serge@hallyn.com,
	linux-audit@redhat.com
Date: Wed, 13 Oct 2021 16:02:30 -0400
Message-ID: <2159283.iZASKD2KPV@x2>
Organization: Red Hat
In-Reply-To: <1634151995-16266-8-git-send-email-deven.desai@linux.microsoft.com>
References: <1634151995-16266-1-git-send-email-deven.desai@linux.microsoft.com>
	<1634151995-16266-8-git-send-email-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 14 Oct 2021 03:53:04 -0400
Cc: linux-fscrypt@vger.kernel.org, dm-devel@redhat.com, jannh@google.com,
	deven.desai@linux.microsoft.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v7 07/16] ipe: add auditing support
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Wednesday, October 13, 2021 3:06:26 PM EDT deven.desai@linux.microsoft.com 
wrote:
> Users of IPE require a way to identify when and why an operation fails,
> allowing them to both respond to violations of policy and be notified
> of potentially malicious actions on their systens with respect to IPE
> itself.

Would you mind sending examples of audit events so that we can see what the 
end result is? Some people add them to the commit text. But we still need to 
see what they look like.

Thanks,
-Steve


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

