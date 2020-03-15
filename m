Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 195F91856A3
	for <lists+dm-devel@lfdr.de>; Sun, 15 Mar 2020 01:28:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584232095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oTZyGWexW6ApE6FOky0S00WoULhWPPfv04ca9egR0tU=;
	b=PzOrnLrI7pGZdgnQLOwDnRs2rZKMOu+ZSqVCmHB/JwiianKW/3MxHVFG35TVvS9gqeWKTD
	OjYKwotw3Q5g29ZLWi1vNnf+4Mnynt1nHNSaRa//e1GiP496Bp8aSzFWUEtlWlFpOGBeq4
	r56Nb5+BVygz92f+BaLurjBLAEaCUvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-8rGVl_1PPruPgHuDRhXXBg-1; Sat, 14 Mar 2020 20:28:11 -0400
X-MC-Unique: 8rGVl_1PPruPgHuDRhXXBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21F52189F762;
	Sun, 15 Mar 2020 00:28:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD945C1B2;
	Sun, 15 Mar 2020 00:28:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C62518089CD;
	Sun, 15 Mar 2020 00:28:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02F0RoQ9017419 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 14 Mar 2020 20:27:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D6002166B2D; Sun, 15 Mar 2020 00:27:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2943F2166B2C
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 00:27:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 897238007C9
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 00:27:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-435-1Qnhze8NOWCgDbE4o5V7TA-1;
	Sat, 14 Mar 2020 20:27:45 -0400
X-MC-Unique: 1Qnhze8NOWCgDbE4o5V7TA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9AB8EAD57;
	Sun, 15 Mar 2020 00:27:43 +0000 (UTC)
Message-ID: <78489690d69561da912f944ef072f18900e679f5.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Sun, 15 Mar 2020 01:27:49 +0100
In-Reply-To: <20200315001935.GU30153@octiron.msp.redhat.com>
References: <20200306230605.3473-1-mwilck@suse.com>
	<20200306230605.3473-5-mwilck@suse.com>
	<20200315001935.GU30153@octiron.msp.redhat.com>
User-Agent: Evolution 3.34.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02F0RoQ9017419
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-14 at 19:19 -0500, Benjamin Marzinski wrote:
> On Sat, Mar 07, 2020 at 12:06:05AM +0100, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > Make sure that data structures used for PERSISTENT RESERVE IN/OUT
> > fit into 8k buffers.
> > 
> > This patch breaks the libmpathpersist ABI.
> > 
> 
> I'm not super worried about this.  I don't really see a way for users
> to
> hurt themselves because of this change, without making some pretty
> odd
> assumptions.  Am I missing something?

I found this:

struct prout_param_descriptor {	
	uint8_t	 key[8];
	uint8_t	 sa_key[8];
[...]
	uint8_t  private_buffer[MPATH_MAX_PARAM_LEN - 24];
	uint32_t num_transportid;
	struct transportid *trnptid_list[];
};

A program written against the old API might assume that the length of
private_buffer was MPATH_MAX_PARAM_LEN, and call e.g.
memset(private_buffer, 0, MPATH_MAX_PARAM_LEN), overwriting
num_transportid.

The same could happen if a program compiled against the new API was
linked against the old. In that case, the overwrite would happen in 
format_transportids().

Martin




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

