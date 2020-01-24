Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 997971487C1
	for <lists+dm-devel@lfdr.de>; Fri, 24 Jan 2020 15:25:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579875928;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CHGMZ921iQQCIIdBFXRfOMK02b6funmg1LatJP1luZ4=;
	b=hMLqkpLq/1qsm0muty6rqqXYoI2WFN7OqS4FD3bCu7Dwjyn/sufdLp4cOnyqZLmGpuG9QI
	MWN8dyEGhKEKOviopswCmQfacv/H9Di2PailTTfrYxyYNt6WWjO1Y597TYHkIhPUMsMEpM
	9GeFnh0M1Ba9zSpNnbSYB/xh/nhKgSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-sSFyi5KEPTSWkOVkq_MuKQ-1; Fri, 24 Jan 2020 09:25:25 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9540313E7;
	Fri, 24 Jan 2020 14:25:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFE1519481;
	Fri, 24 Jan 2020 14:25:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E83D28594B;
	Fri, 24 Jan 2020 14:24:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00OENcDd004944 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 09:23:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6E4432166B32; Fri, 24 Jan 2020 14:23:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 698DE2166B38
	for <dm-devel@redhat.com>; Fri, 24 Jan 2020 14:23:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AEE3196EF8D
	for <dm-devel@redhat.com>; Fri, 24 Jan 2020 14:23:35 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-57-PGO37hUfMWWkp2TnCqEPXg-1; Fri, 24 Jan 2020 09:23:24 -0500
Received: by mail-lf1-f67.google.com with SMTP id r14so1237611lfm.5
	for <dm-devel@redhat.com>; Fri, 24 Jan 2020 06:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=M7Z8KguGyGrtLfBMqY4wl99vU+N7ApmZw1y+IbjQEx0=;
	b=jeDii8UXF7ZQaA4kPOrXE1unMnp0VzX2v5S+zPiF+xvQYyn1ZBG2rMYOqgGtWY7nmo
	1dCUOPJyCoWJk3lIu7bj9Otr5AWsmYRHXY+YWjjPrQg9Spa0OMGxuoDhAa48sTYHFltP
	gljh0zCNTSZRSngh8pwRs1TgPvWyJUsr9GboK6nqeKWo2lGBu++uEx/aiqUJ/GkVvP4c
	6HYVz5PkAiwPftZ4zM8TOP2SEgcBx29HLv6u5BbxkR0IxGFnNyVFrRP58aNs3wsEopJs
	7YSGn3zfX2ghuBeahJETE2nUmh/TZGgyrW8XVcWllRh/Z8kM5hM7pbmsQBvmrS+eSyYl
	NpFw==
X-Gm-Message-State: APjAAAXr4vgHdj8kQfHvBi3voFvdAawoQgG42WtOP4sQI1e2kBz9iM8w
	VNw4s2vDEoyB11Bf8S6M1qgqXQ==
X-Google-Smtp-Source: APXvYqxYFxC8cAjCsNefWipfW5e+yY7MTZfna3SxpxHUdRcvEVbmwtNUP/9O6SCBCuYG19sj+hF7LQ==
X-Received: by 2002:ac2:5388:: with SMTP id g8mr1495011lfh.43.1579875801941;
	Fri, 24 Jan 2020 06:23:21 -0800 (PST)
Received: from [10.94.250.133] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	r21sm3158951ljn.64.2020.01.24.06.23.19
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 24 Jan 2020 06:23:21 -0800 (PST)
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>
References: <BYAPR04MB5749820C322B40C7DBBBCA02863F0@BYAPR04MB5749.namprd04.prod.outlook.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <e67bf36e-18cb-a170-39ad-a1081fae5e50@arrikto.com>
Date: Fri, 24 Jan 2020 16:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5749820C322B40C7DBBBCA02863F0@BYAPR04MB5749.namprd04.prod.outlook.com>
Content-Language: en-US
X-MC-Unique: PGO37hUfMWWkp2TnCqEPXg-1
X-MC-Unique: sSFyi5KEPTSWkOVkq_MuKQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00OENcDd004944
X-loop: dm-devel@redhat.com
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"msnitzer@redhat.com" <msnitzer@redhat.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matias Bjorling <Matias.Bjorling@wdc.com>,
	Stephen Bates <sbates@raithlin.com>,
	"roland@purestorage.com" <roland@purestorage.com>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	"rwheeler@redhat.com" <rwheeler@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	"frederick.knight@netapp.com" <frederick.knight@netapp.com>,
	"zach.brown@ni.com" <zach.brown@ni.com>
Subject: Re: [dm-devel] [LSF/MM/BFP ATTEND] [LSF/MM/BFP TOPIC] Storage: Copy
	Offload
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gMS83LzIwIDg6MTQgUE0sIENoYWl0YW55YSBLdWxrYXJuaSB3cm90ZToKPiBIaSBhbGwsCj4g
Cj4gKiBCYWNrZ3JvdW5kIDotCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiBDb3B5IG9mZmxvYWQgaXMg
YSBmZWF0dXJlIHRoYXQgYWxsb3dzIGZpbGUtc3lzdGVtcyBvciBzdG9yYWdlIGRldmljZXMKPiB0
byBiZSBpbnN0cnVjdGVkIHRvIGNvcHkgZmlsZXMvbG9naWNhbCBibG9ja3Mgd2l0aG91dCByZXF1
aXJpbmcKPiBpbnZvbHZlbWVudCBvZiB0aGUgbG9jYWwgQ1BVLgo+IAo+IFdpdGggcmVmZXJlbmNl
IHRvIHRoZSBSSVNDLVYgc3VtbWl0IGtleW5vdGUgWzFdIHNpbmdsZSB0aHJlYWRlZAo+IHBlcmZv
cm1hbmNlIGlzIGxpbWl0aW5nIGR1ZSB0byBEZW5hcmQgc2NhbGluZyBhbmQgbXVsdGktdGhyZWFk
ZWQKPiBwZXJmb3JtYW5jZSBpcyBzbG93aW5nIGRvd24gZHVlIE1vb3JlJ3MgbGF3IGxpbWl0YXRp
b25zLiBXaXRoIHRoZSByaXNlCj4gb2YgU05JQSBDb21wdXRhdGlvbiBUZWNobmljYWwgU3RvcmFn
ZSBXb3JraW5nIEdyb3VwIChUV0cpIFsyXSwKPiBvZmZsb2FkaW5nIGNvbXB1dGF0aW9ucyB0byB0
aGUgZGV2aWNlIG9yIG92ZXIgdGhlIGZhYnJpY3MgaXMgYmVjb21pbmcKPiBwb3B1bGFyIGFzIHRo
ZXJlIGFyZSBzZXZlcmFsIHNvbHV0aW9ucyBhdmFpbGFibGUgWzJdLiBPbmUgb2YgdGhlIGNvbW1v
bgo+IG9wZXJhdGlvbiB3aGljaCBpcyBwb3B1bGFyIGluIHRoZSBrZXJuZWwgYW5kIGlzIG5vdCBt
ZXJnZWQgeWV0IGlzIENvcHkKPiBvZmZsb2FkIG92ZXIgdGhlIGZhYnJpY3Mgb3Igb24gdG8gdGhl
IGRldmljZS4KPiAKPiAqIFByb2JsZW0gOi0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+IFRoZSBvcmln
aW5hbCB3b3JrIHdoaWNoIGlzIGRvbmUgYnkgTWFydGluIGlzIHByZXNlbnQgaGVyZSBbM10uIFRo
ZQo+IGxhdGVzdCB3b3JrIHdoaWNoIGlzIHBvc3RlZCBieSBNaWt1bGFzIFs0XSBpcyBub3QgbWVy
Z2VkIHlldC4gVGhlc2UgdHdvCj4gYXBwcm9hY2hlcyBhcmUgdG90YWxseSBkaWZmZXJlbnQgZnJv
bSBlYWNoIG90aGVyLiBTZXZlcmFsIHN0b3JhZ2UKPiB2ZW5kb3JzIGRpc2NvdXJhZ2UgbWl4aW5n
IGNvcHkgb2ZmbG9hZCByZXF1ZXN0cyB3aXRoIHJlZ3VsYXIgUkVBRC9XUklURQo+IEkvTy4gQWxz
bywgdGhlIGZhY3QgdGhhdCB0aGUgb3BlcmF0aW9uIGZhaWxzIGlmIGEgY29weSByZXF1ZXN0IGV2
ZXIKPiBuZWVkcyB0byBiZSBzcGxpdCBhcyBpdCB0cmF2ZXJzZXMgdGhlIHN0YWNrIGl0IGhhcyB0
aGUgdW5mb3J0dW5hdGUKPiBzaWRlLWVmZmVjdCBvZiBwcmV2ZW50aW5nIGNvcHkgb2ZmbG9hZCBm
cm9tIHdvcmtpbmcgaW4gcHJldHR5IG11Y2gKPiBldmVyeSBjb21tb24gZGVwbG95bWVudCBjb25m
aWd1cmF0aW9uIG91dCB0aGVyZS4KPiAKPiAqIEN1cnJlbnQgc3RhdGUgb2YgdGhlIHdvcmsgOi0K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IAo+IFdpdGggWzNdIGJlaW5nIGhhcmQgdG8gaGFuZGxlIGFyYml0
cmFyeSBETS9NRCBzdGFja2luZyB3aXRob3V0Cj4gc3BsaXR0aW5nIHRoZSBjb21tYW5kIGluIHR3
bywgb25lIGZvciBjb3B5aW5nIElOIGFuZCBvbmUgZm9yIGNvcHlpbmcKPiBPVVQuIFdoaWNoIGlz
IHRoZW4gZGVtb25zdHJhdGVkIGJ5IHRoZSBbNF0gd2h5IFszXSBpdCBpcyBub3QgYSBzdWl0YWJs
ZQo+IGNhbmRpZGF0ZS4gQWxzbywgd2l0aCBbNF0gdGhlcmUgaXMgYW4gdW5yZXNvbHZlZCBwcm9i
bGVtIHdpdGggdGhlCj4gdHdvLWNvbW1hbmQgYXBwcm9hY2ggYWJvdXQgaG93IHRvIGhhbmRsZSBj
aGFuZ2VzIHRvIHRoZSBETSBsYXlvdXQKPiBiZXR3ZWVuIGFuIElOIGFuZCBPVVQgb3BlcmF0aW9u
cy4KPiAKPiAqIFdoeSBMaW51eCBLZXJuZWwgU3RvcmFnZSBTeXN0ZW0gbmVlZHMgQ29weSBPZmZs
b2FkIHN1cHBvcnQgbm93ID8KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+IFdpdGggdGhlIHJpc2Ugb2Yg
dGhlIFNOSUEgQ29tcHV0YXRpb25hbCBTdG9yYWdlIFRXRyBhbmQgc29sdXRpb25zIFsyXSwKPiBl
eGlzdGluZyBTQ1NJIFhDb3B5IHN1cHBvcnQgaW4gdGhlIHByb3RvY29sLCByZWNlbnQgYWR2YW5j
ZW1lbnQgaW4gdGhlCj4gTGludXggS2VybmVsIEZpbGUgU3lzdGVtIGZvciBab25lZCBkZXZpY2Vz
IChab25lZnMgWzVdKSwgUGVlciB0byBQZWVyCj4gRE1BIHN1cHBvcnQgaW4gdGhlIExpbnV4IEtl
cm5lbCBtYWlubHkgZm9yIE5WTWUgZGV2aWNlcyBbN10gYW5kCj4gZXZlbnR1YWxseSBOVk1lIERl
dmljZXMgYW5kIHN1YnN5c3RlbSAoTlZNZSBQQ0llL05WTWVPRikgd2lsbCBiZW5lZml0Cj4gZnJv
bSBDb3B5IG9mZmxvYWQgb3BlcmF0aW9uLgo+IAo+IFdpdGggdGhpcyBiYWNrZ3JvdW5kIHdlIGhh
dmUgc2lnbmlmaWNhbnQgbnVtYmVyIG9mIHVzZS1jYXNlcyB3aGljaCBhcmUKPiBzdHJvbmcgY2Fu
ZGlkYXRlcyB3YWl0aW5nIGZvciBvdXRzdGFuZGluZyBMaW51eCBLZXJuZWwgQmxvY2sgTGF5ZXIg
Q29weQo+IE9mZmxvYWQgc3VwcG9ydCwgc28gdGhhdCBMaW51eCBLZXJuZWwgU3RvcmFnZSBzdWJz
eXN0ZW0gY2FuIHRvIGFkZHJlc3MKPiBwcmV2aW91c2x5IG1lbnRpb25lZCBwcm9ibGVtcyBbMV0g
YW5kIGFsbG93IGVmZmljaWVudCBvZmZsb2FkaW5nIG9mIHRoZQo+IGRhdGEgcmVsYXRlZCBvcGVy
YXRpb25zLiAoU3VjaCBhcyBtb3ZlL2NvcHkgZXRjLikKPiAKPiBGb3IgcmVmZXJlbmNlIGZvbGxv
d2luZyBpcyB0aGUgbGlzdCBvZiB0aGUgdXNlLWNhc2VzL2NhbmRpZGF0ZXMgd2FpdGluZwo+IGZv
ciBDb3B5IE9mZmxvYWQgc3VwcG9ydCA6LQo+IAo+IDEuIFNDU0ktYXR0YWNoZWQgc3RvcmFnZSBh
cnJheXMuCj4gMi4gU3RhY2tpbmcgZHJpdmVycyBzdXBwb3J0aW5nIFhDb3B5IERNL01ELgo+IDMu
IENvbXB1dGF0aW9uYWwgU3RvcmFnZSBzb2x1dGlvbnMuCj4gNy4gRmlsZSBzeXN0ZW1zIDotIExv
Y2FsLCBORlMgYW5kIFpvbmVmcy4KPiA0LiBCbG9jayBkZXZpY2VzIDotIERpc3RyaWJ1dGVkLCBs
b2NhbCwgYW5kIFpvbmVkIGRldmljZXMuCj4gNS4gUGVlciB0byBQZWVyIERNQSBzdXBwb3J0IHNv
bHV0aW9ucy4KPiA2LiBQb3RlbnRpYWxseSBOVk1lIHN1YnN5c3RlbSBib3RoIE5WTWUgUENJZSBh
bmQgTlZNZU9GLgo+IAo+ICogV2hhdCB3ZSB3aWxsIGRpc2N1c3MgaW4gdGhlIHByb3Bvc2VkIHNl
c3Npb24gPwo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4gSSdkIGxpa2UgdG8gcHJvcG9zZSBhIHNlc3Np
b24gdG8gZ28gb3ZlciB0aGlzIHRvcGljIHRvIHVuZGVyc3RhbmQgOi0KPiAKPiAxLiBXaGF0IGFy
ZSB0aGUgYmxvY2tlcnMgZm9yIENvcHkgT2ZmbG9hZCBpbXBsZW1lbnRhdGlvbiA/Cj4gMi4gRGlz
Y3Vzc2lvbiBhYm91dCBoYXZpbmcgYSBmaWxlIHN5c3RlbSBpbnRlcmZhY2UuCj4gMy4gRGlzY3Vz
c2lvbiBhYm91dCBoYXZpbmcgcmlnaHQgc3lzdGVtIGNhbGwgZm9yIHVzZXItc3BhY2UuCj4gNC4g
V2hhdCBpcyB0aGUgcmlnaHQgd2F5IHRvIG1vdmUgdGhpcyB3b3JrIGZvcndhcmQgPwo+IDUuIEhv
dyBjYW4gd2UgaGVscCB0byBjb250cmlidXRlIGFuZCBtb3ZlIHRoaXMgd29yayBmb3J3YXJkID8K
PiAKPiAqIFJlcXVpcmVkIFBhcnRpY2lwYW50cyA6LQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4gSSdk
IGxpa2UgdG8gaW52aXRlIGJsb2NrIGxheWVyLCBkZXZpY2UgZHJpdmVycyBhbmQgZmlsZSBzeXN0
ZW0KPiBkZXZlbG9wZXJzIHRvOi0KPiAKPiAxLiBTaGFyZSB0aGVpciBvcGluaW9uIG9uIHRoZSB0
b3BpYy4KPiAyLiBTaGFyZSB0aGVpciBleHBlcmllbmNlIGFuZCBhbnkgb3RoZXIgaXNzdWVzIHdp
dGggWzRdLgo+IDMuIFVuY292ZXIgYWRkaXRpb25hbCBkZXRhaWxzIHRoYXQgYXJlIG1pc3Npbmcg
ZnJvbSB0aGlzIHByb3Bvc2FsLgo+IAo+IFJlcXVpcmVkIGF0dGVuZGVlcyA6LQo+IAo+IE1hcnRp
biBLLiBQZXRlcnNlbgo+IEplbnMgQXhib2UKPiBDaHJpc3RvcGggSGVsbHdpZwo+IEJhcnQgVmFu
IEFzc2NoZQo+IFN0ZXBoZW4gQmF0ZXMKPiBaYWNoIEJyb3duCj4gUm9sYW5kIERyZWllcgo+IFJp
YyBXaGVlbGVyCj4gVHJvbmQgTXlrbGVidXN0Cj4gTWlrZSBTbml0emVyCj4gS2VpdGggQnVzY2gK
PiBTYWdpIEdyaW1iZXJnCj4gSGFubmVzIFJlaW5lY2tlCj4gRnJlZGVyaWNrIEtuaWdodAo+IE1p
a3VsYXMgUGF0b2NrYQo+IE1hdGlhcyBCasO4cmxpbmcKPiAKPiBbMV1odHRwczovL2NvbnRlbnQu
cmlzY3Yub3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzEyL0EtTmV3LUdvbGRlbi1BZ2UtZm9y
LUNvbXB1dGVyLUFyY2hpdGVjdHVyZS1IaXN0b3J5LUNoYWxsZW5nZXMtYW5kLU9wcG9ydHVuaXRp
ZXMtRGF2aWQtUGF0dGVyc29uLS5wZGYKPiBbMl0gaHR0cHM6Ly93d3cuc25pYS5vcmcvY29tcHV0
YXRpb25hbAo+IGh0dHBzOi8vd3d3Lm5hcGF0ZWNoLmNvbS9zdXBwb3J0L3Jlc291cmNlcy9zb2x1
dGlvbi1kZXNjcmlwdGlvbnMvbmFwYXRlY2gtc21hcnRuaWMtc29sdXRpb24tZm9yLWhhcmR3YXJl
LW9mZmxvYWQvCj4gICAgICAgIGh0dHBzOi8vd3d3LmVpZGV0aWNvbS5jb20vcHJvZHVjdHMuaHRt
bAo+IGh0dHBzOi8vd3d3LnhpbGlueC5jb20vYXBwbGljYXRpb25zL2RhdGEtY2VudGVyL2NvbXB1
dGF0aW9uYWwtc3RvcmFnZS5odG1sCj4gWzNdIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9ta3AvbGludXguZ2l0IHhjb3B5Cj4gWzRdIGh0dHBzOi8vd3d3LnNw
aW5pY3MubmV0L2xpc3RzL2xpbnV4LWJsb2NrL21zZzAwNTk5Lmh0bWwKPiBbNV0gaHR0cHM6Ly9s
d24ubmV0L0FydGljbGVzLzc5MzU4NS8KPiBbNl0gaHR0cHM6Ly9udm1leHByZXNzLm9yZy9uZXct
bnZtZXRtLXNwZWNpZmljYXRpb24tZGVmaW5lcy16b25lZC0KPiBuYW1lc3BhY2VzLXpucy1hcy1n
by10by1pbmR1c3RyeS10ZWNobm9sb2d5Lwo+IFs3XSBodHRwczovL2dpdGh1Yi5jb20vc2JhdGVz
MTMwMjcyL2xpbnV4LXAycG1lbQo+IFs4XSBodHRwczovL2tlcm5lbC5kay9pb191cmluZy5wZGYK
PiAKPiBSZWdhcmRzLAo+IENoYWl0YW55YQo+IAoKVGhpcyBpcyBhIHZlcnkgaW50ZXJlc3Rpbmcg
dG9waWMgYW5kIEkgd291bGQgbGlrZSB0byBwYXJ0aWNpcGF0ZSBpbiB0aGUKZGlzY3Vzc2lvbiB0
b28uCgpUaGUgZG0tY2xvbmUgdGFyZ2V0IHdvdWxkIGFsc28gYmVuZWZpdCBmcm9tIGNvcHkgb2Zm
bG9hZCwgYXMgaXQgaGVhdmlseQplbXBsb3lzIGRtLWtjb3B5ZC4gSSBoYXZlIGJlZW4gZXhwbG9y
aW5nIHJlZGVzaWduaW5nIGtjb3B5ZCBpbiBvcmRlciB0bwphY2hpZXZlIGluY3JlYXNlZCBJT1BT
IGluIGRtLWNsb25lIGFuZCBkbS1zbmFwc2hvdCBmb3Igc21hbGwgY29waWVzIG92ZXIKTlZNZSBk
ZXZpY2VzLCBidXQgY29weSBvZmZsb2FkIHNvdW5kcyBldmVuIG1vcmUgcHJvbWlzaW5nLCBlc3Bl
Y2lhbGx5CmZvciBsYXJnZXIgY29waWVzIGhhcHBlbmluZyBpbiB0aGUgYmFja2dyb3VuZCAoYXMg
aXMgdGhlIGNhc2Ugd2l0aApkbS1jbG9uZSdzIGJhY2tncm91bmQgaHlkcmF0aW9uKS4KClRoYW5r
cywKTmlrb3MKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpo
dHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

