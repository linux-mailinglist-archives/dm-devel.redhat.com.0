Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8CE73079E
	for <lists+dm-devel@lfdr.de>; Wed, 14 Jun 2023 20:50:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686768633;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8ag4vSCpRG0zMjOhuZotRuRqxTANCO/x4J2wQG5BkDk=;
	b=OHC9n+jVQislDHA6NOx5l+2lc3Y46npnyvsK+Ajv2txhPMGOWmSgkdJmAjXFTWfU0mnV62
	9iQBKXv6av/KguDaPfP4TLcGdQeQjChR00xFNUmSCrwLnTXE8Uxe14Z8fTJMv0fTQciymf
	b9juPqxP+HW+miGBJR/N9FkcCD6RrZE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-vLnp3_abNnSOzW3fV3vueg-1; Wed, 14 Jun 2023 14:50:31 -0400
X-MC-Unique: vLnp3_abNnSOzW3fV3vueg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 076DE1C0513B;
	Wed, 14 Jun 2023 18:50:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7495440C95AB;
	Wed, 14 Jun 2023 18:50:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6247719451EF;
	Wed, 14 Jun 2023 18:50:15 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E8FC19451D9
 for <dm-devel@listman.corp.redhat.com>; Wed, 14 Jun 2023 18:50:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 39C4F492B06; Wed, 14 Jun 2023 18:50:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-cloud1.hosts.prod.upshift.rdu2.redhat.com
 (agk-cloud1.hosts.prod.upshift.rdu2.redhat.com [10.0.13.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21299492C1B;
 Wed, 14 Jun 2023 18:50:04 +0000 (UTC)
Received: by agk-cloud1.hosts.prod.upshift.rdu2.redhat.com (Postfix,
 from userid 3883)
 id 885E74043A65; Wed, 14 Jun 2023 19:48:41 +0100 (BST)
Date: Wed, 14 Jun 2023 19:48:41 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: baomingtong001@208suo.com
Message-ID: <20230614184841.GB63706@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Mail-Followup-To: baomingtong001@208suo.com,
 Alasdair G Kergon <agk@redhat.com>, snitzer <snitzer@kernel.org>,
 dm-devel <dm-devel@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <202306141008237478337@208suo.com>
 <20230614024228.GA63706@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
 <a78b787e3c45de04df95c80dfc2aa511@208suo.com>
MIME-Version: 1.0
In-Reply-To: <a78b787e3c45de04df95c80dfc2aa511@208suo.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH] dm: remove unneeded variable
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
Cc: dm-devel <dm-devel@redhat.com>, snitzer <snitzer@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alasdair G Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMTE6MTI6MTlBTSArMDgwMCwgYmFvbWluZ3RvbmcwMDFA
MjA4c3VvLmNvbSB3cm90ZToKPiAgICDlnKggMjAyMy0wNi0xNCAxMDo0Mu+8jEFsYXNkYWlyIEcg
S2VyZ29uIOWGmemBk++8mgo+ID4gICAgICBEaWQgdGhlIHBhdGNoZWQgY29kZSBjb21waWxlIE9L
IGZvciB5b3U/Cgo+ICAgIFllcyEKIApTbyB3aGF0IGlzIHRoZSBkZWZpbml0aW9uIG9mIERNRU1J
VCB0aGF0IHlvdXIgY29tcGlsZXIgdXNlcyBhbmQgd2h5PwoKQWxhc2RhaXIKCi0tCmRtLWRldmVs
IG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWwK

