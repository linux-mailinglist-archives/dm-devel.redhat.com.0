Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CE3B328EE30
	for <lists+dm-devel@lfdr.de>; Thu, 15 Oct 2020 10:08:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-wf9ojntaP2SPuII7r3SGUw-1; Thu, 15 Oct 2020 04:08:27 -0400
X-MC-Unique: wf9ojntaP2SPuII7r3SGUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4F7864099;
	Thu, 15 Oct 2020 08:08:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B196D5D9CD;
	Thu, 15 Oct 2020 08:08:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B6411826D38;
	Thu, 15 Oct 2020 08:08:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09DEv2aP021585 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 13 Oct 2020 10:57:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B74682A13EF; Tue, 13 Oct 2020 14:57:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B14B62A13F2
	for <dm-devel@redhat.com>; Tue, 13 Oct 2020 14:56:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7693811E79
	for <dm-devel@redhat.com>; Tue, 13 Oct 2020 14:56:59 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam08on2077.outbound.protection.outlook.com [40.107.102.77])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-176-zzvKuEo4NNybegS-TQShRA-1; Tue, 13 Oct 2020 10:56:57 -0400
X-MC-Unique: zzvKuEo4NNybegS-TQShRA-1
Received: from MN2PR19MB2976.namprd19.prod.outlook.com (2603:10b6:208:104::31)
	by MN2PR19MB3216.namprd19.prod.outlook.com (2603:10b6:208:156::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24;
	Tue, 13 Oct 2020 14:56:53 +0000
Received: from MN2PR19MB2976.namprd19.prod.outlook.com
	([fe80::6c23:b8b9:942e:2290]) by
	MN2PR19MB2976.namprd19.prod.outlook.com
	([fe80::6c23:b8b9:942e:2290%6]) with mapi id 15.20.3455.030;
	Tue, 13 Oct 2020 14:56:53 +0000
To: dm-devel@redhat.com
From: Aaron Knister <aknister@ddn.com>
Message-ID: <411a5a5f-c1e5-6cc6-b7ab-7c2ed053398d@ddn.com>
Date: Tue, 13 Oct 2020 10:56:42 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.12.0
X-Originating-IP: [100.16.217.82]
X-ClientProxiedBy: BYAPR06CA0053.namprd06.prod.outlook.com
	(2603:10b6:a03:14b::30) To MN2PR19MB2976.namprd19.prod.outlook.com
	(2603:10b6:208:104::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DDN11654m.local (100.16.217.82) by
	BYAPR06CA0053.namprd06.prod.outlook.com (2603:10b6:a03:14b::30)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21
	via Frontend Transport; Tue, 13 Oct 2020 14:56:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06fad271-0042-4483-454e-08d86f88388a
X-MS-TrafficTypeDiagnostic: MN2PR19MB3216:
X-Microsoft-Antispam-PRVS: <MN2PR19MB3216ECF3A140AAA7782A79B0C6040@MN2PR19MB3216.namprd19.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: hMEPGO/PUyWQhcJZhIYyq5jHGBmA4NEbRLCCZUxCmNdG70z+yv+FiqxdOS8Vt6tSyfWQQZQfb5KGALg2RSySBOH3s7jntm4Gsku3SJSNRtTvH7mOi/+DmzpWrA4DM2onm/DwKSuxLmEiQBH6hJ1TlCg0jlriVd5XsjNf2yYINYtm25Mc3Qed7RG/8jhIXNdHUAelLrNn0tCc4U2io8AjB09LWG+t0LKeH6TlfZTYg6/6y1kN9lzewqEtBFpUX8QI6MCUgKMqAG4QoTIP8u2ghoDPlRTO91kQ/7bIF0ShFuEvvR8z1XAJ2n6jyzVJ6xCxBnTl1Jx9eWsvHnerzT013Bu9ee84Oa54tvdLG/B67IxD26K+R//fvuK/9PM+AjKJ+c3bQyR44GWOLjLyoZTvN3F4Ow8OnLV6d5I8+ZYIPSZScMy6LJ/XwRgGGrlilU8fM0859yPPqVLiv82kuzXSUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR19MB2976.namprd19.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(136003)(396003)(366004)(39830400003)(376002)(346002)(6512007)(8936002)(45080400002)(8676002)(6486002)(6506007)(26005)(478600001)(966005)(83080400001)(52116002)(2616005)(16526019)(186003)(956004)(2906002)(83380400001)(31686004)(6666004)(66556008)(5660300002)(31696002)(36756003)(316002)(66476007)(66946007)(86362001)(6916009)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: 6LcO8+YFTHkYcyRsnTuI/jyorLQmecIg1CEEg4VZ+l5lS3oPgm7Xs1gCR43K/AR/n+YG6CDW2ZjhJYQct/Axfb/Y5YnhWfn0+QEV7geOoLRPpVobQueTjV0yzRvzHsSO72mca8ZYoe+N/b0od/qaF+d+HqKT6zxpoplbqrYh0Hs8TmLzQ0R1L3jG95wwXfVKibrebart4RoVbD/mYPX8UG3DTKbhneth3TxC/LMjz8v5dlFPyOCTncXvWByY6gLi+aUUwpRG3LXdpPEcxDQ9ZGntENasO7GrCOUQPcxr0jUZNclU1bsa+bXG9rYKMKdAHFE58MLmqCmaSOzPis7LAB6AGum1Oq/ymXWdyzMCEHZ3vFhbFEFdpaHK3GbutXOCELHu++jXfrcvP5f93Q3YT5SWZ/S6l5iFnPqz3DZ806R/aKxawSAiw+g9esz1Z/u0iZCuuZUkeCRXrVuqFsqJHJwRBkJvo+fSc+M4L8TLOJd772stjAP2iuYVjAkS4ik/dvfo4wUTv6S6bx2pjw8/3cpN20Df50yttEBv2BZxxMfUdy/xEHvuD4JcnG5RR9Fz7sV9ypWDrDtvpWVZ87vhaAfVvRJ7zK8bLrLqWd6sCkQpxbFF32nn5MlrYOFVydXboPFyT55zSEGC8EX6zmDpXg==
X-OriginatorOrg: ddn.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fad271-0042-4483-454e-08d86f88388a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB2976.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 14:56:53.0814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 753b6e26-6fd3-43e6-8248-3f1735d59bb4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjYHIt9pSlmU4z1U8GYn+DikUJUbEadhMZPHh+CADqhRzUcxTpg60fqJrtn0mHEHnL3gjhMfSOcMGSdENJwcbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3216
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09DEv2aP021585
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 15 Oct 2020 04:07:55 -0400
Subject: [dm-devel] use after free with blk_mq_update_nr_requests racing
 with do_resume/dm_swap_table
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgQWxsLAoKSSd2ZSBiZWVuIGNoYXNpbmcgZG93biBhIGtlcm5lbCBwYW5pYyBbMl0gb24gYSBS
SEVMNyBrZXJuZWwgdGhhdCBzdGVtcyAKZnJvbSBibGtfZG9uZV9zb2Z0aXJxIGNhbGxpbmcgZG1f
ZG9uZSBhdHRlbXB0aW5nIHRvIHJlZmVyZW5jZSB0aW8tPnRpLCAKaG93ZXZlciB0aW8tPnRpIGhh
cyBiZWVuIGZyZWVkIHdoaWNoIGxlYWRzIHRvIHRoZSBwYW5pYy4KCkl0IHRvb2sgbWUgYSB3aGls
ZSB0byBmaWd1cmUgb3V0IHdoYXQgd2FzIGdvaW5nIG9uLCBidXQgaXQgYXBwZWFycyBhcyAKdGhv
dWdoIGJsa19tcV91cGRhdGVfbnJfcmVxdWVzdHMgaXMgcmFjaW5nIHdpdGggZG9fcmVzdW1lL2Rt
X3N3YXBfdGFibGUuIApibGtfbXFfdXBkYXRlX25yX3JlcXVlc3RzIHdpbGwgdW4tcXVpZXNjZSB0
aGUgcXVldWUgd2hlbiBpdCdzIGNvbXBsZXRlLCAKaG93ZXZlciB0aGlzIHVuLXF1aWVzY2UgY2Fu
IHNvbWV0aW1lcyBvY2N1ciB3aGlsZSAKZG9fcmVzdW1lLT5kbV9zd2FwX3RhYmxlIGhhcyBxdWll
c2NlZCB0aGUgcXVldWVzIGJ1dCBiZWZvcmUgCm1kLT5pbW11dGFibGVfdGFibGUgaGFzIGJlZW4g
dXBkYXRlZCB3aXRoIHRoZSBuZXcgdGFibGUgcmVmZXJlbmNlLiBUaGlzIApsZWFkcyB0byBhbiBJ
L08gc25lYWtpbmcgaW4sIHBpY2tpbmcgdXAgdGlvLT50aSBmcm9tIG1kLT5pbW11dGFibGVfdGFi
bGUgCndoaWNoIGlzIHN1YnNlcXVlbnRseSBmcmVlZCBhZnRlciB0aGUgY2FsbCB0byBkbV9zd2Fw
X3RhYmxlIGFuZCB0aGVuIAp3aGVuIHRoZSBzb2Z0aXJxIGhhbmRsZXIgZmlyZXMgdGlvLT50aSBo
YXMgYmVlbiBmcmVlZCBhbmQgd2UgZW5kIHVwIHdpdGggCmEgcGFuaWMuCgpJIGFkZGVkIHNvbWUg
dGltZXJzIGFuZCBkZWJ1ZyBwcmludGsncyBpbnRvIHRoZSBjb2RlIGhvcGVmdWxseSB5b3UgY2Fu
IApzZWUgdGhlIHJhY2UgbW9yZSBjbGVhcmx5IGJlbG93IFsxXS4KCkknbSBzdXJlIHRoZXJlIGFy
ZSBhIG15cmlhZCBvZiBhcHByb2FjaGVzIG9uZSBjb3VsZCB0YWtlIHRvIGZpeCB0aGlzLCAKYnV0
IHRvIG1lIGl0IHNlZW1zIHRoZSBwYXRjaCBoZXJlOgoKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvcGlwZXJtYWlsL2xpbnV4LW52bWUvMjAxNy1EZWNlbWJlci8wMTQ0NDcuaHRtbAoKV2hpY2gg
YWxsb3dzIGNvbmN1cnJlbnQgY2FsbHMgdG8gYmxrX21xX3F1aWVzY2VfcXVldWUgd291bGQgYWRk
cmVzcyB0aGlzIApiZWhhdmlvci4KCldoaWxlIEkgaGF2ZW4ndCB0ZXN0ZWQgdGhpcyBvbiBhIG1h
aW5saW5lIGtlcm5lbCwgaXQgc2VlbXMgdG8gbWUgdGhhdCAKdGhpcyByYWNlIHN0aWxsIGV4aXN0
cyB0aGVyZS4gSSdsbCBhbHNvIHJhaXNlIHRoaXMgdGhyb3VnaCBSZWRIYXQsIGJ1dCAKc2luY2Ug
aXQgc2VlbXMgdG8gbWUgdG8gYmUgYW4gdXBzdHJlYW0gaXNzdWUgYXMgd2VsbCBJIHRob3VnaHQg
YSBwb3N0IApoZXJlIHdvdWxkIGJlIGFwcHJvcHJpYXRlLgoKSSdtIGN1cmlvdXMsIHdoYXQncyB0
aGUgc3RhdGUgb2YgdGhhdCBwYXRjaD8gSSBkbyBzaGFyZSBDaHJpc3RvcGgncyAKY29uY2VybiBh
Ym91dCB0aGUgbnZtZSBkcml2ZXIgYmVpbmcgYWJsZSB0byBmb3JjaWJseSB1bi1xdWllc2NlIHRo
ZSAKcXVldWUgYW5kIGRvbid0IGhhdmUgYW55IHN1Z2dlc3Rpb25zIHRvIG9mZmVyLCBidXQgaXQg
ZG9lcyBzZWVtIHRvIG1lIAp0aGF0IGEgcXVpZXNjZSBvcGVyYXRpb24gaXNuJ3QgcGFydGljdWxh
cmx5IHVzZWZ1bCBpZiBpdCBjYW4gYmUgCnVucXVpZXNjZWQgYnkgYW5vdGhlciBjYWxsZXIgd2l0
aG91dCBrbm93bGVkZ2Ugb2YgdGhlIG9yaWdpbmFsIHF1aWVzY2VyLiAKSXQgYWxtb3N0IHNlZW1z
IGxpa2UgdGhlcmUgYXJlIHR3byBzY2VuYXJpb3MgZm9yIHRoZSBxdWllc2NlL3VucXVpZXNjZSAK
b3BlcmF0aW9ucyB0b2RheS0tCgoxLiBhIG1vbWVudGFyeSBwYXVzZSB3aGVyZSB0aGUgcXVpZXNj
ZS9yZXN1bWUgb2NjdXIgd2l0aGluIHRoZSBzYW1lIApmdW5jdGlvbiB0byBjaGFuZ2UgcXVldWUg
cGFyYW1ldGVycyAodGhpcyBzZWVtcyB0byBiZSBtb3N0IHNpdHVhdGlvbnMpCgoyLiBhIGxvbmdl
ciBwYXVzZSB0byBrZWVwIHJlcXVlc3RzIGZyb20gYmVpbmcgZGlzcGF0Y2hlZCB3aGlsZSBkZXZp
Y2UgCnJlY292ZXJ5IG9jY3VycyAodGhpcyBzZWVtcyB0byBtZSB0byBiZSB0aGUgbnZtZSBjYXNl
KQoKVG8gbWUgaXQgc2VlbXMgdGhlIDJuZCBjYXNlIGlzIGluY29ycmVjdCwgYW5kIG9uZSBvdWdo
dCB0byBkaXN0aW5ndWlzaCAKYmV0d2VlbiBxdWllc2NlZCBhbmQgc3RvcHBlZCAoZS5nLiB5b3Ug
cXVpZXNjZSB0aGUgcXVldWUgdG8gdGhlbiBzdG9wIGl0IApyYXRoZXIgdGhhbiB1c2luZyB0aGUg
cXVpZXNjZSBhcyB0aGUgc3RvcCBtZWNoYW5pc20pLgoKLUFhcm9uCgpbMV0tCgpucl9yZXF1ZXN0
cyBbMTU2NzkuNjE3NzUwXSBibGtfbXFfdXBkYXRlX25yX3JlcXVlc3RzOiBxPWZmZmY5OTQ5MTcy
MGU5ODggCmVudGVyCgpkb19yZXN1bWXCoMKgIFsxNTY3OS42Mzk4NDZdIGRvX3Jlc3VtZVsxMDE1
XTogbWQ9ZmZmZjk5NDkxZTdlZDAwMCAKbmV3X21hcD1mZmZmOTk0OTFkYmM4ODAwCmRvX3Jlc3Vt
ZcKgwqAgWzE1Njc5LjYzOTg0OF3CoMKgwqDCoMKgIGRtX3N1c3BlbmRbMTAxNV06IG1kPWZmZmY5
OTQ5MWU3ZWQwMDAgCnN1c3BlbmRfZmxhZ3M9MiBlbnRlcgpkb19yZXN1bWXCoMKgIFsxNTY3OS42
Mzk4NTBdwqDCoMKgwqDCoMKgwqAgX19kbV9zdXNwZW5kWzEwMTVdOiBlbnRlciAKbWQ9ZmZmZjk5
NDkxZTdlZDAwMCBtZC0+ZmxhZ3M9NjQgbWFwPWZmZmY5OTQ5MWRiYzk2MDAgc3VzcGVuZF9mbGFn
cz0yIAp0YXNrX3N0YXRlPTEgZG1mX3N1c3BlbmRlZF9mbGFncz0xCgpucl9yZXF1ZXN0cyBbMTU2
NzkuNjM5ODYwXcKgwqAgYmxrX21xX3F1aWVzY2VfcXVldWU6IApxPWZmZmY5OTQ5MTcyMGU5ODjC
oMKgwqDCoMKgwqAgXF9fIG9uZSBpcyBmcm9tIGRtX3N1c3BlbmQsIHRoZSBvdGhlciBmcm9tIAp1
cGRhdGVfbnJfcmVxdWVzdHMKZG9fcmVzdW1lwqDCoCBbMTU2NzkuNjQxNzE3XcKgwqDCoMKgwqDC
oMKgwqAgYmxrX21xX3F1aWVzY2VfcXVldWU6IApxPWZmZmY5OTQ5MTcyMGU5ODggL8KgwqAgbm90
IHN1cmUgd2hpY2ggaXMgd2hpY2gsIGJ1dCBkb2Vzbid0IG1hdHRlciBtdWNoCgpkb19yZXN1bWXC
oMKgIFsxNTY3OS42NjY2NzJdwqDCoMKgwqDCoMKgIGRtX21xX3N0b3BfcXVldWU6IHE9ZmZmZjk5
NDkxNzIwZTk4OCAKc3RvcHBlZApkb19yZXN1bWXCoMKgIFsxNTY3OS42NjY2ODRdwqDCoMKgwqAg
X19kbV9zdXNwZW5kWzEwMTVdOiByZXR1cm4gZW5kIAptZD1mZmZmOTk0OTFlN2VkMDAwIG1hcD1m
ZmZmOTk0OTFkYmM5NjAwIHJjPTAKZG9fcmVzdW1lwqDCoCBbMTU2NzkuNjY2Njg4XcKgwqAgZG1f
c3VzcGVuZFsxMDE1XTogbWQ9ZmZmZjk5NDkxZTdlZDAwMCAKc3VzcGVuZF9mbGFncz0yIGV4aXQg
cj0wCmRvX3Jlc3VtZcKgwqAgWzE1Njc5LjY2NjY5MF3CoMKgIGRtX3N3YXBfdGFibGU6IGVudGVy
IG1kPWZmZmY5OTQ5MWU3ZWQwMDAgCm1kLT5mbGFncz02NyBtZC0+aW1tdXRhYmxlX3RhYmxlPWZm
ZmZiMTViMDZkOGQwNDAgdGFibGU9ZmZmZjk5NDkxZGJjODgwMApkb19yZXN1bWXCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbV9tcV9zdG9wX3F1ZXVlIGVudGVy
Cgpucl9yZXF1ZXN0cyBbMTU2NzkuNjY2Njk1XcKgwqDCoMKgwqDCoCBibGtfbXFfcXVpZXNjZV9x
dWV1ZTogcT1mZmZmOTk0OTE3MjBlOTg4Cm5yX3JlcXVlc3RzIFsxNTY3OS42ODg2NzVdIGJsa19t
cV91bnF1aWVzY2VfcXVldWU6IHE9ZmZmZjk5NDkxNzIwZTk4OAoKZG9fcmVzdW1lwqDCoMKgIDE1
Njc5LjY5NDk5NjA3MyA9IGRtX3N0YXJ0X3RpbWUKZG9fcmVzdW1lwqDCoMKgIDE1Njc5LjY5NTAx
MzE1NCA9IGRtX21xX3F1ZXVlX3JxX25zCmRvX3Jlc3VtZcKgwqDCoCAxNTY3OS42OTUwMTMxOTQg
PSBpbml0X3Rpb19ucyAoc2V0IHRpby0+dGkgPSB0aTsgdGkgaXMgCm1kLT5pbW11dGFibGVfdGFi
bGUgKGZmZmZiMTViMDZkOGQwNDApKQoKZG9fcmVzdW1lwqDCoCBbMTU2NzkuNjk1Njc4XcKgwqDC
oMKgIGRtX21xX3N0b3BfcXVldWU6IHE9ZmZmZjk5NDkxNzIwZTk4OCBzdG9wcGVkCmRvX3Jlc3Vt
ZcKgwqAgWzE1Njc5LjY5NTc1Nl3CoMKgIGRtX3N3YXBfdGFibGU6IG1kPWZmZmY5OTQ5MWU3ZWQw
MDAgCm1kLT5mbGFncz02NyAob3JpZyA2NykgbWQtPmltbXV0YWJsZV90YWJsZT1mZmZmYjE1YjA2
ZDkzMDQwIChvcmlnIApmZmZmYjE1YjA2ZDhkMDQwKSBvbGQ9ZmZmZjk5NDkxZGJjODgwMCBuZXc9
ZmZmZjk5NDkxZGJjOTYwMCAKdGFibGUtPnR5cGU9MyAob3JpZyAzKSBzdXNwZW5kZWQ9MQpkb19y
ZXN1bWXCoMKgIFsxNTY3OS42OTU3NThdwqDCoCBkbV9yZXN1bWVbMTAxNV06IG1kPWZmZmY5OTQ5
MWU3ZWQwMDAgZW50ZXIKZG9fcmVzdW1lwqDCoCBbMTU2NzkuNjk1NzYxXSBkbV9tcV9zdGFydF9x
dWV1ZTogcT1mZmZmOTk0OTE3MjBlOTg4IHJlc3VtaW5nCmRvX3Jlc3VtZcKgwqAgWzE1Njc5LjY5
NTc2M10gYmxrX21xX3VucXVpZXNjZV9xdWV1ZTogcT1mZmZmOTk0OTE3MjBlOTg4CmRvX3Jlc3Vt
ZcKgwqAgWzE1Njc5LjcwODIyOV3CoMKgIGRtX3Jlc3VtZVsxMDE1XTogbWQ9ZmZmZjk5NDkxZTdl
ZDAwMCBub3JtYWwgCnJjPTAKZG9fcmVzdW1lwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHRpby0+dGkgZGVzdHJveWVkIChmZmZmYjE1YjA2ZDhkMDQwKQpkb19yZXN1
bWXCoMKgIFsxNTY3OS43MDgyNDddIGRvX3Jlc3VtZVsxMDE1XTogbWQ9ZmZmZjk5NDkxZTdlZDAw
MCAKbmV3X21hcD1mZmZmOTk0OTFkYmM4ODAwIHJjPTAKCnNvZnRpcnEgaGFuZGxlciBmaXJlcz09
PgpQQU5JQyBbMTU2NzkuNzA4NjI5XSBCVUc6IHVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2lu
ZyByZXF1ZXN0IGF0IApmZmZmYjE1YjA2ZDhkMDQwCgoKWzJdLQoKWzE1Njc5LjcwODYyOV0gQlVH
OiB1bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCAKZmZmZmIxNWIwNmQ4
ZDA0MApbMTU2NzkuNzIzMTA0XSBJUDogWzxmZmZmZmZmZmMwMTk1ZDlkPl0gZG1fc29mdGlycV9k
b25lKzB4NWQvMHgzMTAgW2RtX21vZF0KWzE1Njc5LjczMTA5OV0gUEdEIDE3ZmQ2NTA2NyBQVUQg
OGJmYzAyMDY3IFBNRCA4MWQ2NTAwNjcgUFRFIDAKWzE1Njc5LjczNzg0MV0gT29wczogMDAwMCBb
IzFdIFNNUApbMTU2NzkuNzQxOTU0XSBNb2R1bGVzIGxpbmtlZCBpbjogCnN0YXBfZGNmOWExYjFi
MTE0ZDk3NDM2MjMxYjkxYmU2OTE5ZV8yNDI3NShPRSkgZG1fcm91bmRfcm9iaW4gCmliX2lzZXIo
T0UpIGxpYmlzY3NpIHNjc2lfdHJhbnNwb3J0X2lzY3NpIHJwY3NlY19nc3Nfa3JiNSBhdXRoX3Jw
Y2dzcyAKbmZzdjQgZG5zX3Jlc29sdmVyIG5mcyBsb2NrZCBncmFjZSBmc2NhY2hlIGxuZXQoT0Up
IGRlbGxfcmJ1IGxpYmNmcyhPRSkgCnJkbWFfdWNtKE9FKSBpYl91Y20oT0UpIHJkbWFfY20oT0Up
IGl3X2NtKE9FKSBpYl9pcG9pYihPRSkgaWJfY20oT0UpIAppYl91bWFkKE9FKSBtbHg1X2ZwZ2Ff
dG9vbHMoT0UpIG1seDRfZW4oT0UpIG1seDRfaWIoT0UpIG1seDRfY29yZShPRSkgCnN1bnJwYyBp
VENPX3dkdCBpVENPX3ZlbmRvcl9zdXBwb3J0IHNiX2VkYWMgY29yZXRlbXAgaW50ZWxfcmFwbCBp
b3NmX21iaSAKa3ZtX2ludGVsIGt2bSBpcnFieXBhc3MgY3JjMzJfcGNsbXVsIGdoYXNoX2NsbXVs
bmlfaW50ZWwgYWVzbmlfaW50ZWwgbHJ3IApnZjEyOG11bCBnbHVlX2hlbHBlciBhYmxrX2hlbHBl
ciBjcnlwdGQgcGNzcGtyIGpveWRldiBscGNfaWNoIHNnIG1laV9tZSAKbWVpIHdtaSBpcG1pX3Np
IGlwbWlfZGV2aW50ZiBpcG1pX21zZ2hhbmRsZXIgYWNwaV9wb3dlcl9tZXRlciAKcGNjX2NwdWZy
ZXEgZG1fbXVsdGlwYXRoIGJpbmZtdF9taXNjIGtuZW0oT0UpIGlwX3RhYmxlcyBleHQ0IG1iY2Fj
aGUgCmpiZDIgc2RfbW9kIGNyY190MTBkaWYgY3JjdDEwZGlmX2dlbmVyaWMgbWx4NV9pYihPRSkg
aWJfdXZlcmJzKE9FKSAKaWJfY29yZShPRSkgc3JfbW9kClsxNTY3OS44Mzk0OThdwqAgY2Ryb20g
bWdhZzIwMCBpMmNfYWxnb19iaXQgZHJtX2ttc19oZWxwZXIgc3lzY29weWFyZWEgCnN5c2ZpbGxy
ZWN0IHN5c2ltZ2JsdCBmYl9zeXNfZm9wcyB0dG0gYWhjaSBkcm0gbGliYWhjaSBtbHg1X2NvcmUo
T0UpIApsaWJhdGEgY3JjdDEwZGlmX3BjbG11bCB0ZzMgY3JjdDEwZGlmX2NvbW1vbiBtbHhmdyhP
RSkgdmZpb19tZGV2KE9FKSAKdmZpb19pb21tdV90eXBlMSBjcmMzMmNfaW50ZWwgdmZpbyBtZWdh
cmFpZF9zYXMgbWRldihPRSkgZGV2bGluayAKbWx4X2NvbXBhdChPRSkgZHJtX3BhbmVsX29yaWVu
dGF0aW9uX3F1aXJrcyBwdHAgcHBzX2NvcmUgZG1fbWlycm9yIApkbV9yZWdpb25faGFzaCBkbV9s
b2cgZG1fbW9kKE9FKSBbbGFzdCB1bmxvYWRlZDogCnN0YXBfMThkNWU1ODFiOWE4N2Y5MGZhNDZl
NTI5MmJlYTlhY18xNDI1NF0KWzE1Njc5Ljg4MzU0MF0gQ1BVOiAzIFBJRDogMjYgQ29tbToga3Nv
ZnRpcnFkLzMgS2R1bXA6IGxvYWRlZCBUYWludGVkOiAKR8KgwqDCoMKgwqDCoMKgwqDCoMKgIE9F
wqAgLS0tLS0tLS0tLS0tIFQgMy4xMC4wLTEwNjIuOS4xLmVsNy54ODZfNjQgIzEKWzE1Njc5Ljg5
ODEwNV0gSGFyZHdhcmUgbmFtZTrCoMKgwqAgLzBINDdISCwgQklPUyAyLjcuMCAwNS8yMy8yMDE4
ClsxNTY3OS45MDUyNjNdIHRhc2s6IGZmZmY5OTQxYjRlOWMxYzAgdGk6IGZmZmY5OTQxYjQ0ODQw
MDAgdGFzay50aTogCmZmZmY5OTQxYjQ0ODQwMDAKWzE1Njc5LjkxNDQ3M10gUklQOiAwMDEwOls8
ZmZmZmZmZmZjMDE5NWQ5ZD5dIFs8ZmZmZmZmZmZjMDE5NWQ5ZD5dIApkbV9zb2Z0aXJxX2RvbmUr
MHg1ZC8weDMxMCBbZG1fbW9kXQpbMTU2NzkuOTI1NTYxXSBSU1A6IDAwMTg6ZmZmZjk5NDFiNDQ4
N2RhMMKgIEVGTEFHUzogMDAwMTAyMDIKWzE1Njc5LjkzMjM2NF0gUkFYOiAwMDAwMDAwMDAwMDAw
MDAxIFJCWDogMDAwMDAwMDAwMDAwMDAwMCBSQ1g6IApkZWFkMDAwMDAwMDAwMjAwClsxNTY3OS45
NDEyMTJdIFJEWDogZmZmZjk5NDFiNDQ4N2RkOCBSU0k6IGZmZmY5OTQxYjQ0ODdkYzggUkRJOiAK
ZmZmZmIxNWIwNmQ4ZDA0MApbMTU2NzkuOTUwMDY0XSBSQlA6IGZmZmY5OTQxYjQ0ODdkYzggUjA4
OiBmZmZmOTk0OGYxMjgwOTgwIFIwOTogCmZmZmY5OTQ5MWYwNTM5MDAKWzE1Njc5Ljk1ODkxNF0g
UjEwOiAwMDAwMDAwMDAwMDBiNzMxIFIxMTogMDAwMDAwMDAwMDAwMDAwZCBSMTI6IApmZmZmOTk0
OGRmMzE0ZDAwClsxNTY3OS45Njc3NjddIFIxMzogZmZmZjk5NDhmMTI4MGE4MCBSMTQ6IDAwMDAw
MDAwMDAwMDAwMDAgUjE1OiAKMDAwMDAwMDAwMDAwMDAwOQpbMTU2NzkuOTc2NjMxXSBGUzrCoCAw
MDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY5OTQ5MWYwNDAwMDAoMDAwMCkgCmtubEdTOjAw
MDAwMDAwMDAwMDAwMDAKWzE1Njc5Ljk4NjU4MV0gQ1M6wqAgMDAxMCBEUzogMDAwMCBFUzogMDAw
MCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKWzE1Njc5Ljk5MzkxM10gQ1IyOiBmZmZmYjE1YjA2ZDhk
MDQwIENSMzogMDAwMDAwMTAxZDI3MjAwMCBDUjQ6IAowMDAwMDAwMDAwMTYwN2UwClsxNTY4MC4w
MDI4MTBdIENhbGwgVHJhY2U6ClsxNTY4MC4wMDY0NzNdwqAgWzxmZmZmZmZmZmFlZDU4ZDg2Pl0g
YmxrX2RvbmVfc29mdGlycSsweDk2LzB4YzAKWzE1NjgwLjAxMzc0MV3CoCBbPGZmZmZmZmZmYWVh
YTUzMDU+XSBfX2RvX3NvZnRpcnErMHhmNS8weDI4MApbMTU2ODAuMDIwNzE0XcKgIFs8ZmZmZmZm
ZmZhZWFhNTRjOD5dIHJ1bl9rc29mdGlycWQrMHgzOC8weDUwClsxNTY4MC4wMjc2OTNdwqAgWzxm
ZmZmZmZmZmFlYWNlYzI0Pl0gc21wYm9vdF90aHJlYWRfZm4rMHgxNDQvMHgxYTAKWzE1NjgwLjAz
NTI1MV3CoCBbPGZmZmZmZmZmYWVhY2VhZTA+XSA/IGxnX2RvdWJsZV91bmxvY2srMHg0MC8weDQw
ClsxNTY4MC4wNDI3MTBdwqAgWzxmZmZmZmZmZmFlYWM2MWYxPl0ga3RocmVhZCsweGQxLzB4ZTAK
WzE1NjgwLjA0OTEwMF3CoCBbPGZmZmZmZmZmYWVhYzYxMjA+XSA/IGluc2VydF9rdGhyZWFkX3dv
cmsrMHg0MC8weDQwClsxNTY4MC4wNTY4NDddwqAgWzxmZmZmZmZmZmFmMThkZDM3Pl0gcmV0X2Zy
b21fZm9ya19ub3NwZWNfYmVnaW4rMHgyMS8weDIxClsxNTY4MC4wNjUwOTFdwqAgWzxmZmZmZmZm
ZmFlYWM2MTIwPl0gPyBpbnNlcnRfa3RocmVhZF93b3JrKzB4NDAvMHg0MApbMTU2ODAuMDcyODQ4
XSBDb2RlOiAwMSAwMCAwMCA0ZCA4NSBlNCAwZiA4NCA5MiAwMCAwMCAwMCA0OCA4YiA0MyA0OCA0
MSAKOGIgNWQgNTggNGQgOGIgYWMgMjQgNzAgMDEgMDAgMDAgNDggYzEgZTggMTYgNDkgOGIgN2Qg
MDggNDggODMgZjAgMDEgODMgCmUwIDAxIDw0OD4gODMgM2YgMDAgNzQgMGMgNDggOGIgNTcgMDgg
ODQgYzAgNGMgOGIgNDIgNjAgNzUgNDEgODMgZmIgODcKWzE1NjgwLjA5NjU2Nl0gUklQwqAgWzxm
ZmZmZmZmZmMwMTk1ZDlkPl0gZG1fc29mdGlycV9kb25lKzB4NWQvMHgzMTAgW2RtX21vZF0KWzE1
NjgwLjEwNTE4MV3CoCBSU1AgPGZmZmY5OTQxYjQ0ODdkYTA+ClsxNTY4MC4xMTAwOTFdIENSMjog
ZmZmZmIxNWIwNmQ4ZDA0MAoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRo
YXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

