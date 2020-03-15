Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C89D2185FD7
	for <lists+dm-devel@lfdr.de>; Sun, 15 Mar 2020 21:46:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584305208;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fNahWQN8ej3jULPKDQ+QEvmuLIHCXIrArMYZU1zyjuA=;
	b=XIPaHhLJ7MuuyYCncmdPU9YoonW/b4Lb4XMAXe0XND7mrUSH+7MJ3FC4wq6IcquXUjqUJc
	jabmr70jL2wLqLYnGyyzZ/Z0SUW4b4WUZZOUDE6BIwsZ+OBcSUgRORJAX08ofvRGVr1vkv
	Wh/+XN1XEMxawsMwNeOj6v6kltBr5K0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-KKkQQFi-OIyEYelAxfHrlw-1; Sun, 15 Mar 2020 16:46:45 -0400
X-MC-Unique: KKkQQFi-OIyEYelAxfHrlw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EBBB800D50;
	Sun, 15 Mar 2020 20:46:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF7FB60BE2;
	Sun, 15 Mar 2020 20:46:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6DFE85EFB;
	Sun, 15 Mar 2020 20:46:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02FKjw35007202 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 15 Mar 2020 16:45:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B17DA884EA; Sun, 15 Mar 2020 20:45:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC407874FE
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 20:45:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66DAD101A55A
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 20:45:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-359-GrEvlElMPU-7ZgKIVExr2A-1;
	Sun, 15 Mar 2020 16:45:53 -0400
X-MC-Unique: GrEvlElMPU-7ZgKIVExr2A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 0E8EFABE7;
	Sun, 15 Mar 2020 20:45:52 +0000 (UTC)
Message-ID: <a561b7a338a2941b4929742e10016bfd59330bc8.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Sun, 15 Mar 2020 21:45:58 +0100
In-Reply-To: <78489690d69561da912f944ef072f18900e679f5.camel@suse.com>
References: <20200306230605.3473-1-mwilck@suse.com>
	<20200306230605.3473-5-mwilck@suse.com>
	<20200315001935.GU30153@octiron.msp.redhat.com>
	<78489690d69561da912f944ef072f18900e679f5.camel@suse.com>
User-Agent: Evolution 3.34.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02FKjw35007202
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Bond <dbond@suse.com>
Subject: Re: [dm-devel] [PATCH 4/4] libmpathpersist: ABI change: limit
 data-in/out size to 8192 bytes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2020-03-15 at 01:27 +0100, Martin Wilck wrote:
> 
> A program written against the old API might assume that the length of
> private_buffer was MPATH_MAX_PARAM_LEN, and call e.g.
> memset(private_buffer, 0, MPATH_MAX_PARAM_LEN), overwriting
> num_transportid.

And programs compiled against old headers would obviously use the
wrong offsets for num_transportids and trnptid_list.

Similar for struct print_fulldescr_list.descriptors.

So I this does indeed break the ABI. Perhaps we shouldn't apply this
without implementing clean so numbering.

Regards
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

