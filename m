Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE58C6AA0AF
	for <lists+dm-devel@lfdr.de>; Fri,  3 Mar 2023 21:41:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677876093;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8Oy3DRsR4q9bzfVAs4KiPLRYnk6nY8xt1QDHcnQbCQg=;
	b=iuy0TIJfjjpHhyycfdTmMlXkx7cwXAGg9dNeq+dyFgKecBUXgn0tB/T8AeH3zUmr3AN204
	F4wMs08baaT0TFWwdRpE4EUHtIXwd9fNdp+57w+V0yZgA665aZw7JbdSLDH37mgcEtKR48
	1zxtq1ZJ4CfCc69/z5m4fSQzhd7YiT0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-_S9hWiBGM0q2MzcQNplAMg-1; Fri, 03 Mar 2023 15:41:32 -0500
X-MC-Unique: _S9hWiBGM0q2MzcQNplAMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D459329ABA24;
	Fri,  3 Mar 2023 20:41:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2AA22026D4B;
	Fri,  3 Mar 2023 20:41:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 41CD11948654;
	Fri,  3 Mar 2023 20:41:23 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BC18D19465A0
 for <dm-devel@listman.corp.redhat.com>; Fri,  3 Mar 2023 20:41:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AFB73492C18; Fri,  3 Mar 2023 20:41:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A89C4492C14
 for <dm-devel@redhat.com>; Fri,  3 Mar 2023 20:41:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BF213C025B5
 for <dm-devel@redhat.com>; Fri,  3 Mar 2023 20:41:21 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-zjjyDLZsMleG0aJ9pOSowA-1; Fri,
 03 Mar 2023 15:41:20 -0500
X-MC-Unique: zjjyDLZsMleG0aJ9pOSowA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 240EB1F74B;
 Fri,  3 Mar 2023 20:41:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E458B1329E;
 Fri,  3 Mar 2023 20:41:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Plr2NW1bAmT6SwAAMHmgww
 (envelope-from <mwilck@suse.com>); Fri, 03 Mar 2023 20:41:17 +0000
Message-ID: <fb99dac64dd41a6a44b3c7ce065608b45ff467c4.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Brian Bunker <brian@purestorage.com>
Date: Fri, 03 Mar 2023 21:41:17 +0100
In-Reply-To: <5A7BD289-0205-42FF-84CD-7C218511A280@purestorage.com>
References: <CAHZQxyJH1etLR5gHuWk4c6-ieioqA4GrJ173B60bnTppke58dw@mail.gmail.com>
 <4bc4be79c2d00cc959932ec935179a46be4b2fbc.camel@suse.com>
 <5A7BD289-0205-42FF-84CD-7C218511A280@purestorage.com>
User-Agent: Evolution 3.46.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [dm-devel] [PATCH] [PATCH] libmultipath: return 'ghost' state
 when port is in transition
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
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIzLTAzLTAzIGF0IDA5OjE4IC0wODAwLCBCcmlhbiBCdW5rZXIgd3JvdGU6Cj4g
PiAKPiBIZWxsbyBNYXJ0aW4sIAo+IAo+IERvZXNu4oCZdCAic29tZXRoaW5nIGluIGJldHdlZW4g
ZmFpbGVkIGFuZCB1cOKAnSBzZW1hbnRpY3MgZGVzY3JpYmUgQUxVQQo+IHN0YXRlIHRyYW5zaXRp
b25pbmcgcHJldHR5IHdlbGw/Cgp0cmFuc2l0aW9uaW5nIC0geWVzLiBzdGFuZGJ5IC0gPz8KCk1h
cnRpbgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6
Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbAo=

