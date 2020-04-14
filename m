Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EA00D1A8371
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 17:40:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586878851;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sEUmcOJoBz4A2Zq82u3y9XqA5h7ITQ3cNUV9UJ45y3U=;
	b=c53CaopcKDf40OGifwmIKKBiI6Hdx969CoQ/mEmSCc9DikiSGeKsuPTeBFVz+u1d+kJkPR
	wzWycBI4iO3aQL9yzFHtSNmQpN5Wr9H1SazuRVYRKwlQCZP1V2Q1tkvOH8ae1qV/Nx9iz4
	UI/nhFOXppmQJ1+YMZx41Unmj+A9bO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-co1xfHKXOMKtJSJ3EPIULA-1; Tue, 14 Apr 2020 11:40:49 -0400
X-MC-Unique: co1xfHKXOMKtJSJ3EPIULA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A282B8018A4;
	Tue, 14 Apr 2020 15:40:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6068126513;
	Tue, 14 Apr 2020 15:40:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 499F918089C8;
	Tue, 14 Apr 2020 15:40:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EFcHaL018095 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:38:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9BB1C2166B2B; Tue, 14 Apr 2020 15:38:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97CEF2166B2A
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 15:38:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB6308FF66A
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 15:38:15 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-330-1tzK1UEINJCj3rY_Nz9NvQ-1;
	Tue, 14 Apr 2020 11:38:13 -0400
X-MC-Unique: 1tzK1UEINJCj3rY_Nz9NvQ-1
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 27DD977D;
	Tue, 14 Apr 2020 15:38:10 +0000 (UTC)
Date: Tue, 14 Apr 2020 09:38:09 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: deven.desai@linux.microsoft.com
Message-ID: <20200414093809.2c6ef93b@lwn.net>
In-Reply-To: <20200406221439.1469862-12-deven.desai@linux.microsoft.com>
References: <20200406221439.1469862-1-deven.desai@linux.microsoft.com>
	<20200406221439.1469862-12-deven.desai@linux.microsoft.com>
Organization: LWN.net
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EFcHaL018095
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, sashal@kernel.org, dm-devel@redhat.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
	jmorris@namei.org, zohar@linux.ibm.com,
	mdsakib@linux.microsoft.com, linux-block@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com, agk@redhat.com, serge@hallyn.com
Subject: Re: [dm-devel] [RFC PATCH v2 11/12] documentation: Add IPE
	Documentation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon,  6 Apr 2020 15:14:38 -0700
deven.desai@linux.microsoft.com wrote:

> From: Deven Bowers <deven.desai@linux.microsoft.com>
> 
> Add IPE's documentation to the kernel tree.
> 
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>

Thanks for including this nice documentation from the outset!  I have a
couple of tiny nits to pick, but nothing really substantive to complain
about, so:

  Acked-by: Jonathan Corbet <corbet@lwn.net>

[...]

> +IPE is a Linux Security Module, which allows for a configurable policy

I'd drop the comma (I told you these were nits!)

[...]

> +IPE Policy
> +~~~~~~~~~~
> +
> +IPE policy is designed to be both forward compatible and backwards
> +compatible. There is one required line, at the top of the policy,
> +indicating the policy name, and the policy version, for instance:
> +
> +::
> +
> +   policy_name="Ex Policy" policy_version=0.0.0

This pattern can be compressed a bit by just putting the "::" at the end of
the last line of text:

	indicating the policy name, and the policy version, for instance::

	   policy_name="Ex Policy" policy_version=0.0.0

The result is a bit more readable in the plain-text format, IMO, and
renders exactly the same in Sphinx.

Thanks,

jon


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

