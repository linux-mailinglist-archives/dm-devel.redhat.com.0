Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D5D78CD0A
	for <lists+dm-devel@lfdr.de>; Tue, 29 Aug 2023 21:33:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693337604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m+1kY14Y5QUZo+FfWsV0C1DJcYr+hg61iQ6VYBTchUQ=;
	b=Xu4QdkXsEZDKgrdAOZKY1/n3usFEOkXqdKy9OaFiAlxmwp8lCqLWhO3NpPDlqyBvmRR4fO
	5vrUJed4frSQM9k0HOy1FWxvlpoYWUeya+YdZLQmJdeVWz2hUoefmLni+x1uEdED3pg5uH
	QeaTKinQHcZsMBhztqwGYRSgq8p4Yrg=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-etmfIxAFPZ6rx100BMt7BQ-1; Tue, 29 Aug 2023 15:33:22 -0400
X-MC-Unique: etmfIxAFPZ6rx100BMt7BQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 233EC1C05ACE;
	Tue, 29 Aug 2023 19:33:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 582A92166B26;
	Tue, 29 Aug 2023 19:33:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DBFD91946A4B;
	Tue, 29 Aug 2023 19:33:11 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CB3A41946594
 for <dm-devel@listman.corp.redhat.com>; Tue, 29 Aug 2023 19:33:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A4D8B4021C9; Tue, 29 Aug 2023 19:33:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D3D8401051
 for <dm-devel@redhat.com>; Tue, 29 Aug 2023 19:33:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6620F3C02B78
 for <dm-devel@redhat.com>; Tue, 29 Aug 2023 19:33:09 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-348-k7j_RMTMN6WAvzConaAuCw-1; Tue,
 29 Aug 2023 15:33:05 -0400
X-MC-Unique: k7j_RMTMN6WAvzConaAuCw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 299742184B;
 Tue, 29 Aug 2023 19:33:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90BB6138E2;
 Tue, 29 Aug 2023 19:33:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E1OZH+9H7mSBEwAAMHmgww
 (envelope-from <mwilck@suse.com>); Tue, 29 Aug 2023 19:33:03 +0000
Message-ID: <0cd241e369cc86a92215f22a34e4fedca586ce37.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Etienne Aujames <eaujames@ddn.com>, "dm-devel@redhat.com"
 <dm-devel@redhat.com>
Date: Tue, 29 Aug 2023 21:33:02 +0200
In-Reply-To: <ac898b4b79947c22d510bb365e9b507faac1f016.camel@ddn.com>
References: <ac898b4b79947c22d510bb365e9b507faac1f016.camel@ddn.com>
User-Agent: Evolution 3.48.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH] libmultipath: fix max_sectors_kb on adding
 path
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
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2023-08-23 at 16:24 +0000, Etienne Aujames wrote:
> From: Etienne AUJAMES <eaujames@ddn.com>
> 
> A user can change the value of max_sectors_kb on the multipath device
> and its path devices.
> So when a path is deleted and then re-added, its value will not be
> the
> same as the multipath device. In that case the IOs could be mis-
> sized.
> 
> On reload, this patch re-apply max_sectors_kb value of the multipath
> device on its path devices.
> 
> Signed-off-by: Etienne AUJAMES <eaujames@ddn.com>

Next time, please send your patch with an email software that doesn't
corrupt the patch content by inserting line breaks.

Regards
Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

