Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0935A1C9D41
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 23:27:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588886850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qieHd6s/QRwnE1mkkvH3Q9nhlZFHNvLyHMQMm1pyVUE=;
	b=Lx9ioFchrK8imWo2MbQvvjbD8rlLuwy6S9C4S2JdEgL6l9/owlRNO3aGU9SwvSpl+P37Ns
	USiDg0Qsb5d3Xamvx3ae+U+CGpDpr9hY8VK7Lh+6BaL/Tme8RWvffHOr5ABIk2bnjMKZ48
	viKcF02FqwZs751JyIVsyMhRRY8EqD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-67rADPbCPlqlu9vEHKfyfQ-1; Thu, 07 May 2020 17:27:25 -0400
X-MC-Unique: 67rADPbCPlqlu9vEHKfyfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8859A18FE860;
	Thu,  7 May 2020 21:27:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D91F461546;
	Thu,  7 May 2020 21:27:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A54EF4CAA0;
	Thu,  7 May 2020 21:27:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047LR6Ge026485 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 17:27:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D4951182E9; Thu,  7 May 2020 21:27:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6964C1182EF
	for <dm-devel@redhat.com>; Thu,  7 May 2020 21:27:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED424185A78B
	for <dm-devel@redhat.com>; Thu,  7 May 2020 21:27:03 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-397-_cSDzapGPISKNdwiykgLhQ-1;
	Thu, 07 May 2020 17:27:01 -0400
X-MC-Unique: _cSDzapGPISKNdwiykgLhQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D0896AC91;
	Thu,  7 May 2020 21:27:02 +0000 (UTC)
Message-ID: <163b4bdf2797c01b1c61e9556e4c86c0bed238f9.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, device-mapper
	development <dm-devel@redhat.com>
Date: Thu, 07 May 2020 23:26:58 +0200
In-Reply-To: <CABr-Gnd6Gv-dgO+K=hAMMF+KtBm7AATHuo5P+DVjhvTAQ+qM+w@mail.gmail.com>
References: <CABr-Gnd6Gv-dgO+K=hAMMF+KtBm7AATHuo5P+DVjhvTAQ+qM+w@mail.gmail.com>
User-Agent: Evolution 3.36.2
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 047LR6Ge026485
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] multipath-tools 0.8.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Christophe,

On Mon, 2020-05-04 at 15:21 +0200, Christophe Varoqui wrote:
> Hi list,
> 
> the 0.8.4 version is tagged.
> The backlog is merged up to Martin tests/ patchset from March 3rd
> (included).

many thanks. There have been just a few reviewed patches in the
meantime. In case you've lost track, I've gathered them in the usual
place:

https://github.com/openSUSE/multipath-tools/commits/upstream-queue

Regards,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

