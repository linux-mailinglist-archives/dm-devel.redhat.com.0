Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 82CAE1998DC
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 16:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585665988;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=30mbD3uHUNHeKnALCfukfsQNlXtNjUUXsqrZa05y+7U=;
	b=AbgRrRVNaIBcOWWrPao00ZYqNu69a2kvID1SPs71sdDAJK68QRbaVvEaPwhz1mEwzUbaVW
	WurZ5FbZK1LhU2IdnS+ZTwfgwpj2cZvZQD+wERW6dICsxamWFah7S6S2XmBR4vZQ0BR6DO
	Gi3eJHrDhxTIiyo+hq6FTWHAVVNhXk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-Y9RVGKbmPNumLR5a_mXw_g-1; Tue, 31 Mar 2020 10:46:25 -0400
X-MC-Unique: Y9RVGKbmPNumLR5a_mXw_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2C84149C2;
	Tue, 31 Mar 2020 14:46:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6623E19C58;
	Tue, 31 Mar 2020 14:46:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2442E18034E9;
	Tue, 31 Mar 2020 14:46:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02VEjuct015051 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 10:45:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1ED545C3FA; Tue, 31 Mar 2020 14:45:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A4FF5C1BB;
	Tue, 31 Mar 2020 14:45:53 +0000 (UTC)
Date: Tue, 31 Mar 2020 10:45:52 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200331144551.GA15485@redhat.com>
References: <20200327070849.67694-1-hare@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200327070849.67694-1-hare@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] dm-zoned: add 'status' and 'message' callbacks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Mar 27 2020 at  3:08am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> Add callbacks to supply information for 'dmsetup status'
> and 'dmsetup info', and implement the message 'reclaim'
> to start the reclaim worker.

Who/What will use the 'reclaim' message?  Shouldn't it be documented?
Think the dmz_status changes should be split out from this reclaim
message.

BTW, these dm-zoned changes (and your following 4 patch set) missed 5.7
-- merge window opened Sunday.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

